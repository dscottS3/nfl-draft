class Pick < ActiveRecord::Base
  belongs_to :round
  belongs_to :player
  belongs_to :team
  attr_accessible :round_id, :player_id, :team_id
end
