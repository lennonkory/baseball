class Player < ActiveRecord::Base
	
  validates :name, presence: true


end
