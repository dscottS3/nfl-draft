class Team < ActiveRecord::Base
  attr_accessible :division, :name
  has_many :players
  has_many :rounds
  has_many :picks
end
