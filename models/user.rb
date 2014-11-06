class User < ActiveRecord::Base
  has_many :owner_objects
  has_many :hangman_games, through: :owner_objects
  has_many :tictactoe_games, through: :owner_objects
  has_many :tictactoe_game_moves
  has_many :hangman_game_moves
  

  validates :username, :password, presence: true
  validates :username, uniqueness: true

end