class CreateHangmanGamesTable < ActiveRecord::Migration
  def change
    create_table :hangman_games do |t|
      t.integer :moves
      t.string :answer
      t.boolean :in_progress
      t.timestamps
    end
  end
end
