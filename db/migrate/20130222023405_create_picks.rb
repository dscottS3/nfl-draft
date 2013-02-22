class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :round
      t.references :team
      t.references :player

      t.timestamps
    end
    add_index :picks, :round_id
    add_index :picks, :team_id
    add_index :picks, :player_id
  end
end
