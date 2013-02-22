class Player < ActiveRecord::Base
  attr_accessible :name, :position
  belongs_to :team
  has_one :pick
  
  def self.available
    player_ids = Pick.pluck('player_id')
    if player_ids.size > 0
      Player.where("id NOT IN (?)", player_ids).order('name ASC')
    else
      Player.order('name ASC')
    end
  end
  
end
