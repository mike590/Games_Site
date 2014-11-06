class CreateTictactoeMovesTable < ActiveRecord::Migration
  def change
    create_table :tictactoe_game_moves do |t|
      t.references :tictactoe_game
      t.references :user
      t.integer :space
      t.string :player
      t.timestamps
    end  
  end
end
