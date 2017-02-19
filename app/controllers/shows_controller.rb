class ShowsController < ApplicationController

  get '/shows' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      @shows = Show.all
      erb :'/shows/shows'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

end
