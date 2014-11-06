class HangmanGame < ActiveRecord::Base
  has_many :owner_objects
  has_many :users, through: :owner_objects
  has_many :hangman_game_moves
  
end