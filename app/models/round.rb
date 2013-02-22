class Round < ActiveRecord::Base
  attr_accessible :number, :pick, :team_id
  has_many :picks
  belongs_to :team
  
  def current_round_pick
    pick = Pick.last
    if pick.present?
      pick_number = pick.round.pick.to_i + 1
      Round.find_by_pick(pick_number.to_s)
    else
      Round.find_by_pick("1")
    end
  end
end
