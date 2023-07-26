# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tournament = Tournament.create!(
  name: "2022"
)

4.times do |i|
  Team.create!(
    name: "Team#{i}",
    tournament: tournament
  )
end

team1 = Team.first
puts "Team 1 #{team1.name}"
players1 = 12.times.map do 
  player = Player.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    doc_number: Faker::IDNumber.valid
  )
end

players1.each do | player |
  TeamPlayer.create!(player: player, team: team1)
end

team2 = Team.last
puts "Team 2 #{team2.name}"
players2 = 12.times.map do 
  Player.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    doc_number: Faker::IDNumber.valid
  )
end

players2.each do | player |
  TeamPlayer.create!(player: player, team: team2)
end