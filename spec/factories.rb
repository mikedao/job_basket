FactoryGirl.define do
  factory :job do
    position "Janitor"
    posting_date Time.now
    description "Clean stuff"
    location "Denver, CO"
    source "GitHub"
    before(:create) do |job|
      job.company = create(:company)
    end
  end

  factory :company do
    name "PHP Worldwide"
    location "Denver, CO"
    url "http://phprules.com"
  end
end
