class AddStuffToBatter < ActiveRecord::Migration
  def change
  	add_column :batters, :age, :integer
    add_column :batters, :team, :string
    add_column :batters, :lg, :string
    add_column :batters, :games, :integer
    add_column :batters, :pa, :integer
    add_column :batters, :ab, :integer
    add_column :batters, :r, :integer
    add_column :batters, :h, :integer
  end
end
