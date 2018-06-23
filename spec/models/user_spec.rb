# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # Ensure User model has a 1:m relationship with the todo records
  it { should have_many(:todos) }

  # Validation tests
  # Ensure column presence
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
