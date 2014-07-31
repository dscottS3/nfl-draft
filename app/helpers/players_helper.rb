module PlayersHelper
  def positions
    positions = Array.new
    Player.positions.each do |player|
      positions << [player.position, player.position, {:'data-target' => players_url(position: player.position)}]
    end
    positions
  end
end
