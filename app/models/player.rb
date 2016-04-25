class Player < ActiveRecord::Base
	
  validates :lastname, presence: true
  has_many :stats, dependent: :destroy

end
