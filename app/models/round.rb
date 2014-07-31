class Round < ActiveRecord::Base
  attr_accessible :number, :pick, :team_id
  has_many :picks
  belongs_to :team
  
  def current_round_pick
    last_pick = Pick.last
    if last_pick.present?
      pick_number = last_pick.round.pick.to_i + 1
      Round.find_by_pick(pick_number.to_s)
    else
      Round.first
    end
  end
end
