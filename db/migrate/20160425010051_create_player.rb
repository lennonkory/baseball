class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :name
    	t.string :year
    	t.string :picture
    	
    end
  end
end
