require 'rails_helper'

RSpec.describe Todo, type: :model do
  # ensure we have a 1:n relationship with the item model
  it { should have_many(:items).dependent(:destroy) }

  # ensure column presence
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
