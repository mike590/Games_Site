class HangmanGameMove < ActiveRecord::Base
  belongs_to :hangman_game
  belongs_to :user
end