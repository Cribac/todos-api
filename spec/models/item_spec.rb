# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  # ensure item record belongs to to a single todo record
  it { should belong_to(:todo) }
  # ensure column presence
  it { should validate_presence_of(:name) }
end
