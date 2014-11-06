class CreateTictactoeGamesTable < ActiveRecord::Migration
  def change
    create_table :tictactoe_games do |t|
      t.integer :moves
      t.boolean :in_progress
      t.integer :winner_id
      t.timestamps
    end
  end
end
