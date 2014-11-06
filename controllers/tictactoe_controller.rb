class TictactoeController < ApplicationController
  
  get '/' do
    authenticate!
    if @current_user
      @current_games = @current_user.tictactoe_games
      erb :'tictactoe/home'
    else
      @login_error = "You must be logged in to navigate there. Register or login."
      erb :'users/home'
    end
  end

  get '/challenge' do
    authenticate!
    @challengers = User.all.select do |user|
      user.id != @current_user.id
    end
    erb :'tictactoe/challenge'
  end

  post '/' do
    authenticate!
    new_tictactoe_game = TictactoeGame.create(moves: 1, in_progress: true)
    if !new_tictactoe_game.valid?
      @errors = new_tictactoe_game.errors.full_messages
      @errors.push("Game was not created correctly.")
      erb :'tictactoe/challenge'
    else
      first_owner_object = OwnerObject.create(user_id: @current_user.id, tictactoe_game_id: new_tictactoe_game.id)
      if !first_owner_object.valid?
        @errors = first_owner_object.errors.full_messages
        @errors.push("First game object not created correctly.")
        erb :'tictactoe/challenge'
      else
        second_owner_object = OwnerObject.create(user_id: params[:user2_id], tictactoe_game_id: new_tictactoe_game.id)
        if !second_owner_object.valid?
          @errors = second_owner_object.errors.full_messages
          @errors.push("Second object failed.")
          erb :'tictactoe/challenge'
        else
          redirect "/tictactoe/game/#{new_tictactoe_game.id}"
        end
      end
    end
  end

  get '/game/:id' do
    @current_game = TictactoeGame.find(params[:id])
    erb :'tictactoe/game'
  end



end