class Player < ActiveRecord::Base
  attr_accessible :name, :position
  belongs_to :team
  has_one :pick
  after_create :set_permalink
  
  def self.available
    player_ids = Pick.pluck('player_id')
    if player_ids.size > 0
      Player.where("id NOT IN (?)", player_ids).order('name ASC')
    else
      Player.order('name ASC')
    end
  end
  
  def set_permalink
    self.permalink = "#{name.parameterize}-#{id}"
    save
  end
  
  def self.positions
    select(:position).group(:position).order('position ASC')
  end
  
end
