require "rails_helper"

RSpec.describe User, type: :model do
  describe "attributes" do
    it "has a uid" do
      user = create(:user)

      expect(user.uid).to eq("12345")
    end

    it "has a username" do
      user = create(:user)

      expect(user.username.class).to eq(String)
      expect(user.username).to eq("turingstudent")
    end

    it "has an email" do
      user = create(:user)

      expect(user.email).to eq("turingstudent@turing.io")
    end

    it "has a profile image" do
      user = create(:user)

      expect(user.profile_image_url).to eq("https://avatars.githubusercontent.com/u/8440504?v=3")
    end
  end

  describe "validations" do
    it { should have_many(:jobs_liked) }
    it { should have_many(:jobs_hidden) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
  end
end
