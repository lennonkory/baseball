class AddTimeToPitcher < ActiveRecord::Migration
  def change
  	add_column :pitchers, :created_at, :datetime
    add_column :pitchers, :updated_at, :datetime
  end
end
