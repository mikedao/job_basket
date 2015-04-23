require "rails_helper"

RSpec.describe Hiddenjob, type: :model do
  describe "validations" do
    it { should belong_to(:job) }
    it { should belong_to(:user) }
  end
end
