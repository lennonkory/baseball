class ChangeYearToString < ActiveRecord::Migration
  def up
  	change_column :stats, :year, :string
  end

  def down
  	change_column :stats, :year, :integer
  end
end
