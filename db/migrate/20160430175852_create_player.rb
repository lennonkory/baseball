class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :firstname
        t.string :lastname
        t.string :picture
        t.string :url
        t.string :team
        t.string :position
        t.string :year
    end
  end
end
