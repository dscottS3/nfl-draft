# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
Player.destroy_all
Team.destroy_all
Round.destroy_all
Pick.destroy_all

# INSERT PLAYER DATA FROM CSV

players_csv = File.read("#{Rails.root}/db/players.csv")
players = CSV.parse(players_csv)
players.each_with_index do |player, i|
  #INSERT ROW, SKIP ROW 1 (HEADER)
  name = player[0].strip
  position = player[1].strip
  Player.create(name: name, position: position) unless i == 0
end

# INSERT TEAM DATA FROM CSV

teams_csv = File.read("#{Rails.root}/db/teams.csv")
teams = CSV.parse(teams_csv)
teams.each_with_index do |team, i|
  #INSERT ROW, SKIP ROW 1 (HEADER)
  name = team[0].strip
  division = team[1].strip
  Team.create(name: name, division: division) unless i == 0
end

# INSERT ROUND DATA FROM CSV

rounds_csv = File.read("#{Rails.root}/db/order.csv")
rounds = CSV.parse(rounds_csv)
rounds.each_with_index do |round, i|
  unless i == 0
    number = round[0].strip
    pick = round[1].strip
    team_name = round[2].strip
    
    # FIND TEAM BY TEAM NAME TO MAKE ASSOCIATION
    team = Team.find_by_name(team_name)
    
    #INSERT ROW, SKIP ROW 1 (HEADER)
    Round.create(number: number, pick: pick, team_id: team.id)
  end
end