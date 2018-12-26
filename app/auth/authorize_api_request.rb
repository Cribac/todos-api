# frozen_string_literal: true

class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    # Check if user is in database and memoize user object
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token

    # Handle user not found
  rescue ActiveRecord::RecordNotFound => err
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{err.message}")
    )
  end

  # Decode auth token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # Check for token in `Authorization` header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
