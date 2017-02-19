class ShowsController < ApplicationController

  get '/shows' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      @shows = Show.all #Find by id current_user
      erb :'/shows/shows'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  get '/shows/new' do
    if logged_in?
      erb :'/shows/create_show'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  get '/shows/:id' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      erb :'/shows/display_shows'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

end
