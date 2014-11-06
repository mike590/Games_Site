class TictactoeGame < ActiveRecord::Base
  has_many :owner_objects
  has_many :users, through: :owner_objects
  has_many :tictactoe_game_moves


  def read_moves
    self.tictactoe_game_moves.each do |move|
      @gamestate[move.space] = move.player
      win?
    end
  end

  def win?    
    if self.in_progress
      victory = false
      # Horizontal victory
      if @gamestate[1] == @gamestate[2] && @gamestate[1] == @gamestate[3] && @gamestate[1] != "empty"
        victory = true
      end
      if @gamestate[4] == @gamestate[5] && @gamestate[4] == @gamestate[6] && @gamestate[4] != "empty"
        victory = true
      end
      if @gamestate[7] == @gamestate[8] && @gamestate[7] == @gamestate[9] && @gamestate[7] != "empty"
        victory = true
      end
      # Diagonal victory
      if @gamestate[1] == @gamestate[5] && @gamestate[1] == @gamestate[9] && @gamestate[1] != "empty"
        victory = true
      end
      if @gamestate[7] == @gamestate[5] && @gamestate[7] == @gamestate[3] && @gamestate[7] != "empty"
        victory = true
      end
      # Vertical victory
      if @gamestate[1] == @gamestate[4] && @gamestate[1] == @gamestate[7] && @gamestate[1] != "empty"
        victory = true
      end
      if @gamestate[5] == @gamestate[2] && @gamestate[5] == @gamestate[8] && @gamestate[5] != "empty"
        victory = true
      end
      if @gamestate[3] == @gamestate[6] && @gamestate[9] == @gamestate[3] && @gamestate[3] != "empty"
        victory = true
      end

      if victory
        winner = User.find(self.moves.last.user_id)
        self.update(in_progress: false, winner_id: winner.id)
      end
    end
  end

  def display
    @gamestate ||= {
      1 => "empty",
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    @tag_string = "<div id='boardwrap' style='width: 90%; height: 70%; margin: 30px auto;'>"
    @gamestate.each do |space, player|
      @tag_string << "<canvas width='100' height='100'id='space#{space}' class='#{player}'></canvas>\n"
    end
    @tag_string << "</div>"
    @tag_string
  end


end

























