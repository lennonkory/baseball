class AddYearToBatter < ActiveRecord::Migration
  def change
  	add_column :batters, :year, :string 
  end
end
