class CreateGameOwnershipTable < ActiveRecord::Migration
  def change
    create_table :owner_objects do |t|
      t.references :tictactoe_game
      t.references :hangman_game
      t.references :user
      t.timestamps
    end
  end
end
