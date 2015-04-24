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

20.times do
  Jobtag.create(
    tag_id: rand(1..10),
    job_id: rand(1..10)
  )
end
puts "JobTags Created"
