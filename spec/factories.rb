FactoryGirl.define do
  factory :job do
    position "World Class PHP Developer"
    posting_date  3.days.ago
    description "We only want the best of the best..."
    location "Denver, CO"
    source "www.the-internet.com"
    company
  end

  factory :company do
    name "PHP Worldwide"
  end
end
