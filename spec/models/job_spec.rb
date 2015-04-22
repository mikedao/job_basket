require "rails_helper"

RSpec.describe Job, type: :model do
  describe "validations" do
    it { should belong_to(:company) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:posting_date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:company_id) }
  end
end
