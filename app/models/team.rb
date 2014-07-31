class Team < ActiveRecord::Base
  attr_accessible :division, :name
  has_many :players
  has_many :rounds
  has_many :picks
  
  after_create :set_permalink
  
  def set_permalink
    self.permalink = "#{name.parameterize}"
    save
  end
end
