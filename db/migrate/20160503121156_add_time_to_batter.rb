class AddTimeToBatter < ActiveRecord::Migration
  def change
  	add_column :batters, :created_at, :datetime
    add_column :batters, :updated_at, :datetime
  end
end
