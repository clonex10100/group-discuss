# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = 3.times.reduce([]) { |array, i| array << User.create(username: Faker::Internet.unique.username , password: 'password') }

groups = 5.times.reduce([]) { |array, i| array << Group.create(name: Faker::Lorem.word) }
50.times do
  users.each do |user|
    topic = user.topics.build(title: Faker::Lorem.sentences(number: 1)[0], content: Faker::Lorem.sentences(number: 4).join(' '), group: groups[rand(3)])
    topic.save
  end
end

200.times do
  Topic.all[rand(Topic.all.length)].comments.build(user: users[rand(3)], content: Faker::Lorem.sentences(number: 3).join(' ')).save
end

300.times do
  value = rand(10) > 1 ? 1 : -1
  users[rand(3)].votes.build(topic: Topic.all[rand(Topic.all.length)], value: value).save
end
