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
    name "Twitter"
    location "Denver, CO"
    url "http://phprules.com"
  end

  factory :user do
    uid "12345"
    username "turingstudent"
    email "turingstudent@turing.io"
    profile_image_url "nowhere@example.com"
    token "faketoken"
  end

  factory :tag do
    sequence(:name) { |i| "Ruby #{i}.0" }
  end
end
