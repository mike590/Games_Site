class CreateHangmanMovesTable < ActiveRecord::Migration
  def change
    create_table :hangman_game_moves do |t|
      t.references :hangman_game
      t.references :user
      t.string :choice
      t.timestamps
    end 
  end
end
