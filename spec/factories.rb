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

  factory :user do
    username "Jimbo"
    email "Jimbo@example.com"
    token "somelongtoken"
    uid "1223456"
    profile_image_url "http://turing.io/pic"
  end
end
