class CreateBatter < ActiveRecord::Migration
  def change
    create_table :batters do |t|
    	t.integer :second_base
        t.integer :third_base
        t.integer :hr
        t.integer :rbi
        t.integer :sb
        t.integer :cs
        t.integer :bb
        t.integer :so
        t.integer :hbp
        t.integer :sh
        t.integer :sf
        t.float :ba
        t.float :obp
        t.float :slg
        t.float :ops
        t.integer :player_id

    end
  end
end
