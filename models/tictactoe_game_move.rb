class TictactoeGameMove < ActiveRecord::Base
  belongs_to :tictactoe_game
  belongs_to :user

 
end