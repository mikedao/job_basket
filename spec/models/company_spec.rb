require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validations" do
    it { should have_many(:jobs) }
    it { should validate_presence_of(:name) }
  end
end
