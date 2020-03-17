# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'test1@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
user = User.create!(email: 'test2@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
user = User.create!(email: 'test3@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
user = User.create!(email: 'test4@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
user = User.create!(email: 'test5@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
user = User.create!(email: 'test6@twitterapp.com', password: 'test12345', password_confirmation: 'test12345')
5.times { |i| user.tweets.create(tweet: "Tweet #{i} of #{user.uid}") }
