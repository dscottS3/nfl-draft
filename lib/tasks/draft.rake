namespace :draft do
  desc "Assigning player to a team of the current round."
  task player: :environment do
    pick = Pick.last
    @player = Player.available.order('name ASC').first
    @round = pick.present? ? Round.find_by_number(pick.round.number) : Round.new
    @current_round = @round.current_round_pick
    @pick = Pick.create(
      round_id:   @current_round.id,
      team_id:    @round.current_round_pick.team_id,
      player_id:  @player.id
    )
    puts "Assigned #{@pick.player.name} to #{@pick.team.name} in Round #{@current_round.number} as pick number #{@current_round.pick}"
  end
end