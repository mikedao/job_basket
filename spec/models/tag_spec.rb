require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
    it { should have_many(:jobs) }
  end

  describe "attributes" do
    it "should have a name" do
      tag = create(:tag)

      expect(tag.name).to eq("Ruby")
    end
  end
end
