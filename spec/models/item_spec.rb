require "rails_helper"

RSpec.describe Item, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_numericality_of(:price).is_less_than(1000000).is_greater_than(0) }

  it { should allow_value(5.99).for(:price) }
  it { should_not allow_value(5.999).for(:price) }
end
