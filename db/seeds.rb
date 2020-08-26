# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all


# Add 20 users
# Add 5 investors
puts 'Generating investors'
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

# Add 15 owners
puts 'Generating owners...'
15.times do
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

# Add several projects for each owner
puts 'Generating projects...'
User.where(role: 'owner').each do
  rand(1..4).times do
    Project.create!(
      name: "#{Faker::Movies::HarryPotter.spell} #{Faker::Food.fruits}",
      total_funding: (50..10_000).to_a.sample,
      total_shares: (1..100).to_a.sample,
      open?: [true, false].sample,
      category: %w( health finance nature technology).sample,
      owner_id: User.where(role: 'owner').sample.id
    )
  end
end
puts 'Projects done!'

# Add several fundings for each investor
puts 'Generating fundings...'
User.where(role: 'investor').each do |investor|
  rounds = rand(1..Project.count)
  for i in (1..rounds).to_a do
    Funding.create!(
      funding_amount: (1..10_000).to_a.sample,
      funding_shares: (1..100).to_a.sample,
      project_id: Project.all[i-1].id,
      investor_id: investor.id,
      accepted?: [true, false].sample
    )
    i -= 1
  end
end
puts 'Fundings done!'

# Add several bookmarks for each investor
puts 'Generating bookmarks...'
User.where(role: 'investor').each do |investor|
  rounds = rand(1..Project.count)
  for i in (1..rounds).to_a do
    Bookmark.create!(
      investor_id: investor.id,
      project_id: Project.all[i-1].id,
    )
    i -= 1
  end
end
puts 'Bookmarks done!'
