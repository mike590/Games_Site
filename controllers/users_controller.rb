class UsersController < ApplicationController


  get '/' do
    authenticate!
    erb :'users/home'
  end

  get '/register' do
    erb :'users/register'
  end

  post '/' do
    new_user = User.create(params[:user])
    if new_user.valid?
      session[:current_user] = new_user
      redirect '/users'
    else
      @errors = new_user.errors.full_messages
      erb :'users/register'
    end
  end


end