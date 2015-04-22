FactoryGirl.define do
  factory :job do
    position "Janitor"
    posting_date Time.now
    description "Clean stuff"
    location "Denver, CO"
  end
end
