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

project_1 = Project.create!(
    name: "Social Supermarket",
    description: "Create a food market that sells food to low-income communities at a discounted price. Discounted food is donated (or purchased very cheaply) from food suppliers and other supermarkets, who cannot sell the food themselves for a variety of reasons such as approaching expiry dates, dented cans, and product mislabeling.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Erase Hunger",
    owner_id: User.where(role: 'owner').sample.id
  )
file_1 = URI.open('https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_1.photo.attach(io: file_1, filename: 'project_1.png', content_type: 'image/png')

project_2 = Project.create!(
    name: "Used Textbooks for Social Change",
    description: "Partner with student groups/clubs to collect used textbooks at the end of each semester. Students donate their used textbooks. Some of the textbooks are re-sold to students at the college/university of their collection source; some of the textbooks are donated to students in need at underserved universities in the developing world. The profits are split between the student groups/clubs, program administration costs, and any remaining funds are used to support social programs in developing communities.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Provide Quality Education",
    owner_id: User.where(role: 'owner').sample.id
  )
file_2 = URI.open('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_2.photo.attach(io: file_2, filename: 'project_2.png', content_type: 'image/png')

project_3 = Project.create!(
    name: "Online Socially Conscious Marketplace",
    description: "Help underserved artisans sell their products to the world by building a platform that makes it easy for them. Artisans can either manage their online store directly, or the platform can act merely as a listing service that connects the artisans face-to-face with buyers. Revenue is created by either charging listing fees directly to the artisan, via a commission on goods sold, or built-in as a premium fee to the buyer. Profit generated can be used to fund social services that directly affect the artisan communities.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Create Decent Work and Economic Growth",
    owner_id: User.where(role: 'owner').sample.id
  )
file_3 = URI.open('https://images.unsplash.com/photo-1530601925101-42efae542166?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_3.photo.attach(io: file_3, filename: 'project_3.png', content_type: 'image/png')

project_4 = Project.create!(
    name: "Sustainable Water",
    description: "Build small water purification stations in communities in developing countries using off-the-shelf products. Initial funds to build it can come from traditional charitable methods, or through debt/equity financing; the communities can be partial owners (or full owners, if using cooperative business model). Ongoing costs to maintain and staff the water station come from the sale of purified water to its beneficiaries, but at near break-even levels, costing almost nothing for the beneficiaries.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Improve Clean Water and Sanitation",
    owner_id: User.where(role: 'owner').sample.id
  )
file_4 = URI.open('https://images.unsplash.com/photo-1546531130-0f36255d9d49?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_4.photo.attach(io: file_4, filename: 'project_4.png', content_type: 'image/png')

project_5 = Project.create!(
    name: "Micro Lending",
    description: "Create a platform for individuals and organizations to lend money directly to entrepreneurs who would otherwise not get funding, such as those in the developing world. Charge a small fee to cover the operational costs.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Reduce Inequality",
    owner_id: User.where(role: 'owner').sample.id
  )
file_5 = URI.open('https://images.unsplash.com/photo-1579621970795-87facc2f976d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')
project_5.photo.attach(io: file_5, filename: 'project_5.png', content_type: 'image/png')

project_6 = Project.create!(
    name: "Social Crowdfunding",
    description: "Build a platform for social entrepreneurs to find groups of funders. Similar to the Micro Lending platform, but lenders take a promise of something in the future in return for ‘donating’ a bit of money to the Social Entrepreneur’s project now. Charge a small fee to cover the operational costs of the platform.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Increase Industry, Innovation, and Infrastructure",
    owner_id: User.where(role: 'owner').sample.id
  )
file_6 = URI.open('https://images.unsplash.com/photo-1501386761578-eac5c94b800a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_6.photo.attach(io: file_6, filename: 'project_6.png', content_type: 'image/png')

project_7 = Project.create!(
    name: "Compreneurship",
    description: "Compreneurship unites students and disadvantaged people to develop and execute entrepreneurial projects. In a recent project, students studying design, journalism, and business joined up with local homeless people to create and distribute an original newspaper. Disadvantaged street vendors who distributed the papers earned a whopping 150,000 euros. Basically, Compreneurship puts student projects to valuable, real-life use.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Increase Industry, Innovation, and Infrastructure",
    owner_id: User.where(role: 'owner').sample.id
  )
file_7 = URI.open('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60')
project_7.photo.attach(io: file_7, filename: 'project_7.png', content_type: 'image/png')

project_8 = Project.create!(
    name: "Arsenic Absorbent",
    description: "Professor and Fulbright-Nehru scholar Arup SenGupta is researching his way to a solution for clean, safe drinking water around the world. if you don’t think arsenic poisoning is a serious problem anymore, consider the 140 million people who’ve been affected by it. From India to the US, eight countries have experienced reduced rates of arsenic poisoning since SenGupta developed the first reusable arsenic absorbent.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Improve Clean Water and Sanitation",
    owner_id: User.where(role: 'owner').sample.id
  )
file_8 = URI.open('https://post.healthline.com/wp-content/uploads/2020/08/732x549_THUMBNAIL_Arsenic-Poisoning-1-732x549.jpg')
project_8.photo.attach(io: file_8, filename: 'project_8.png', content_type: 'image/png')

project_9 = Project.create!(
    name: "Biolite",
    description: "We are a start-up that uses thermoelectric technology to make wood-burning stoves clean and safe. Amazingly, the mini stoves also charge cell phones and LED lights. Biolite has worked to create efficient energy with clients like Johnson & Johnson, Hewlett Packard, and Nike. These compact, affordable stoves make cooking easier- not only for frequent campers, but for families in 3rd world countries as well.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Advance Life On Land",
    owner_id: User.where(role: 'owner').sample.id
  )
file_9 = URI.open('https://i.vimeocdn.com/video/285204599_640.jpg')
project_9.photo.attach(io: file_9, filename: 'project_9.png', content_type: 'image/png')

project_10 = Project.create!(
    name: "Swipes for the Homeless",
    description: "Swipes for the Homeless is an organization founded by college students who wanted to give back to their community. Now, Swipes has grown to include multiple US colleges including Berkley, UCLA, and Northwestern University. Students have the opportunity to donate their leftover meal plan points to local homeless people. Since its inception, Swipes has donated 330,000 pounds of food.",
    total_funding: (5_000..10_000).to_a.sample,
    total_shares: 100,
    open: true,
    category: "Erase Hunger",
    owner_id: User.where(role: 'owner').sample.id
  )
file_10 = URI.open('https://www.swipehunger.org/wp-content/uploads/2019/03/Rectangle-2.7.jpg')
project_10.photo.attach(io: file_10, filename: 'project_10.png', content_type: 'image/png')


puts 'Projects done!'
# ["Eliminate Poverty", "Erase Hunger", "Establish Good Health and Well-Being", "Provide Quality Education", "Enforce Gender Equality", "Improve Clean Water and Sanitation", "Grow Affordable and Clean Energy", "Create Decent Work and Economic Growth", "Increase Industry, Innovation, and Infrastructure", "Reduce Inequality", "Mobilize Sustainable Cities and Communities", "Influence Responsible Consumption and Production", "Organize Climate Action", "Develop Life Below Water", "Advance Life On Land", "Guarantee Peace, Justice, and Strong Institutions", "Build Partnerships for the Goals"].sample,

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
      accepted: [true, false].sample
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
