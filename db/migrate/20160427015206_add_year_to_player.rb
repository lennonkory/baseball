class AddYearToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :year, :string 
  end
end
