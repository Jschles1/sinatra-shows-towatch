require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shows secret"
  end

  # Welcome page
  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      # If @current_user isn't already set, find user in db with same id as current session id and set it 
      # to @current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
