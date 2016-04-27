class Player < ActiveRecord::Base
	
  validates :lastname, presence: true

  has_many :batter, dependent: :destroy
  has_many :pitchers, dependent: :destroy

end
