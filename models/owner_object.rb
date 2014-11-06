class OwnerObject < ActiveRecord::Base
  belongs_to :hangman_game
  belongs_to :tictactoe_game
  belongs_to :user
end