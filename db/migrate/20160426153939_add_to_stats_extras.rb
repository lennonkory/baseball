class AddToStatsExtras < ActiveRecord::Migration
  def change
  	add_column :stats, :hbp, :integer
  	add_column :stats, :sh, :integer
  	add_column :stats, :sf, :integer
  end
end
