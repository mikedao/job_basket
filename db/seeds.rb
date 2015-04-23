Jobtag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("jobtags")
Tag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("tags")
Job.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("jobs")
Company.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("companies")

30.times do
  Job.create(
    position: Faker::Name.title,
    posting_date: rand(1...10).days.ago,
    description: Faker::Lorem.paragraphs(3),
    location: "#{Faker::Address.city}, #{Faker::Address.state}",
    company_id: rand(1...10),
    source: Faker::Name.name
  )
end
puts "Jobs Created"

10.times do
  Company.create(
    name: "Apple",
  )
end
puts "Companies Created"

30.times do
  Tag.create(
    name: "#{Faker::Hacker.adjective} #{Faker::Hacker.adjective}",
  )
end
puts "Tags Created"

20.times do |i|
  Jobtag.create(
    tag_id: rand(2..15),
    job_id: rand(2..15)
  )
end
puts "JobTags Created"
