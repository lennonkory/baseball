class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
        t.integer :year
        t.integer :age
        t.string :team
        t.string :lg
        t.integer :games
        t.integer :pa
        t.integer :ab
        t.integer :r
        t.integer :h
        t.integer :second_base
        t.integer :third_base
        t.integer :hr
        t.integer :rbi
        t.integer :sb
        t.integer :cs
        t.integer :bb
        t.integer :so
        t.float :ba
        t.float :obp
        t.float :slg
        t.float :ops
        t.integer :player_id
    end
  end
end
