class CreateFavourite < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
    	t.integer :user_id
    	t.integer :player_id
    end
  end
end
