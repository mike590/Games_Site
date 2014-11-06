class SessionsController < ApplicationController

  get '/new' do
    erb :'sessions/login'
  end

  post '/' do
    username = params[:username]
    password = params[:password]
    users = User.all
    new_user = users.find do |user|
      username == user.username && password == user.password
    end
    if new_user
      session[:current_user] = new_user
      redirect '/'
    else
      @error = "Incorrect username and password combination."
      erb :'sessions/login'
    end
  end

  get '/destroy' do
    session[:current_user] = nil
    redirect '/'
  end


end