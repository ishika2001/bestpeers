# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Event.destroy_all
# Organizer.destroy_all

5.times do |i|
  Event.create(title: "title#{i+10}", date: Date.today, time: Time.now, venue:"venue#{i+10}", 
  description:"desc#{i+10}")
end

# 10.times do |i|
#   User.create(email: "a#{i+5}@gmail.com", name: "name#{i+5}", password:"zzzzzz", password_confirmation:
#   "zzzzzz", role:"organizer")
# end