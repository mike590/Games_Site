class ApplicationController < Sinatra::Base

  helpers Sinatra::AuthenticationHelper, Sinatra::LinkHelper, Sinatra::FormHelper
  enable :sessions, :method_override

  before do
    @connection = ActiveRecord::Base.establish_connection({
      adapter: 'postgresql',
      database: 'games_db'
      })
  end
  after do
    @connection.disconnect!
  end

  set :views, File.expand_path("../../views", __FILE__)
  set :public_dir, File.expand_path("../../public", __FILE__)


  get '/' do
    redirect '/users'
  end


end