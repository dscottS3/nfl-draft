class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :number
      t.string :pick
      t.integer :team_id

      t.timestamps
    end
  end
end
