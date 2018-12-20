require 'rails_helper'

RSpec.describe Play, type: :model do
  it { should validate_presence_of(:counter) }
  it { should validate_presence_of(:img_url) }
  it { should validate_numericality_of(:counter).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:counter).is_less_than_or_equal_to(10) }
end
