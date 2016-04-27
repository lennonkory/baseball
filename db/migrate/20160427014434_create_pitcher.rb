class CreatePitcher < ActiveRecord::Migration
  def change
    create_table :pitchers do |t|
    	t.string :year
        t.integer :age
        t.string :team
        t.string :lg
        t.integer :w
        t.integer :l
        t.float :wl
        t.float :era
        t.integer :games
        t.integer :gs
        t.integer :gf
        t.integer :cg
        t.integer :sho
        t.integer :sv
        t.float :ip
        t.integer :h
        t.integer :r
        t.integer :er
        t.integer :hr
        t.integer :bb
        t.integer :so
        t.integer :hbp
        t.integer :bk
        t.integer :wp
        t.float :whip
        t.integer :player_id
    end
  end
end
