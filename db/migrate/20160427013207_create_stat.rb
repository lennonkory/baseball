class CreateStat < ActiveRecord::Migration
  def change
    create_table :stats do |t|
    	t.string :name
    end
  end
end
