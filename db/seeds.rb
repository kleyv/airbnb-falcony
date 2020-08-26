# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all


# Add 10 users
# Add 5 investors
puts 'Generatiing investors'
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name.downcase}#{last_name}"
  email = "#{username.downcase}@gmail.com"
  User.create!(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: email,
    role: 'investor',
  password: 'passwordi'
  )
end
puts 'Investors done!'

# Add 5 owners
puts 'Generatiing owners'
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name.downcase}#{last_name}"
  email = "#{username.downcase}@gmail.com"
  User.create!(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: email,
    role: 'owner',
    password: 'passwordo'
  )
end
puts 'Owners done!'

# Add 5 projects
puts 'Generatiing projects'
User.where(role: 'owner').each do
  Project.create!(
    name: "#{Faker::Movies::HarryPotter.spell} #{Faker::Food.fruits}",
    total_funding: (50..10_000).to_a.sample,
    total_shares: (5..100).to_a.sample,
    open: [true, false].sample,
    category: %w( health finance nature technology).sample,
    owner_id: User.where(role: 'owner').sample.id
  )
end
puts 'Projects done!'

# Add 5 fundings
puts 'Generatiing fundings'
User.where(role: 'investor').each do
  Funding.create!(
    funding_amount: (0..10_000).to_a.sample,
    funding_shares: (5..100).to_a.sample,
    project_id: Project.all.sample.id,
    investor_id: User.where(role: 'investor').sample.id,
    accepted: [true, false].sample
    )
end
puts 'Fundings done!'

# Add 5 bookmarks
puts 'Generatiing bookmarks'
User.where(role: 'investor').each do
  Bookmark.create!(
    investor_id: User.where(role: 'investor').sample.id,
    project_id: Project.all.sample.id
    )
end
puts 'Bookmarks done!'
