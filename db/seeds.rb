# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'devise'
include Faker

10.times do
	User.create!(
		email: Faker::Internet.unique.safe_email,
		password: 'helloworld',
		password_confirmation: 'helloworld'
		)
end

10.times do
	RegisteredApplication.create!(
		name: Faker::App.name,
		url: Faker::Internet.url,
		user: User.first
		)
end

20.times do
	Event.create!(
		name: Faker::HitchhikersGuideToTheGalaxy.starship,
		registered_application: RegisteredApplication.first,
		created_at: Faker::Date.backward(100)
		)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
