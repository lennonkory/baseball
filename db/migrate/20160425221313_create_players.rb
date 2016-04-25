class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
     	t.string :firstname
     	t.string :lastname
    	t.string :picture
    	t.string :url
    	t.string :team
    end
  end
end
