# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Message.destroy_all
Room.destroy_all
User.destroy_all

# Create test users
alice = User.create!(
  username: "alice",
  password_digest: "password"
)

bob = User.create!(
  username: "bob", 
  password_digest: "password"
)

charlie = User.create!(
  username: "charlie",
  password_digest: "password"
)

puts "✅ Created #{User.count} users"

# Create rooms
general = Room.create!(
  name: "General",
  slug: "general",
  description: "General discussion for everyone"
)

random = Room.create!(
  name: "Random",
  slug: "random", 
  description: "Off-topic discussions and fun"
)

tech = Room.create!(
  name: "Tech Talk",
  slug: "tech-talk",
  description: "Discuss programming, Rails, and technology"
)

puts "✅ Created #{Room.count} rooms"

# Create some initial messages
Message.create!(
  room: general,
  user: alice,
  content: "Welcome to Chat Rails! 👋"
)

Message.create!(
  room: general,
  user: bob,
  content: "Hey everyone! Excited to be here!"
)

Message.create!(
  room: tech,
  user: alice,
  content: "Rails 7.1 with Hotwire is amazing for real-time features!"
)

Message.create!(
  room: tech,
  user: charlie,
  content: "Agreed! ActionCable makes WebSockets so easy."
)

Message.create!(
  room: random,
  user: bob,
  content: "What's everyone working on today?"
)

puts "✅ Created #{Message.count} messages"
puts ""
puts "🎉 Seed complete!"