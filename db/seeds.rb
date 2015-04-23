# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  Job.create(
              position: Faker::Name.title,
              posting_date: rand(1...10).days.ago,
              description: Faker::Lorem.sentence(3),
              location: "#{Faker::Address.city}, #{Faker::Address.state}",
              company_id: rand(1...10),
              source: Faker::Name.name
            )
end
puts "Jobs Created"

10.times do
  Company.create(
                 name: "#{Faker::Company.name} #{Faker::Company.suffix}",
                 url: Faker::Internet.url,
                 location: "#{Faker::Address.city}, #{Faker::Address.state}",
                )
end
puts "Companies Created"

20.times do
  Tag.create(
             name: Faker::Hacker.adjective,
            )
end
puts "Tags Created"

100.times do
  Jobtag.create(
                tag_id: rand(1...20),
                job_id: rand(1...20)
               )
end
puts "JobTags Created"
