class ShowsController < ApplicationController

  # Shows index
  get '/shows' do
    if logged_in?
      # Get all shows belonging to current user
      @shows = current_user.shows
      erb :'/shows/shows'
    else
      flash[:message] = "You must log in to access this page."
      erb :'users/login'
    end
  end

  # New Show form
  get '/shows/new' do
    if logged_in?
      @show = Show.new
      erb :'/shows/create_show'
    else
      flash[:message] = "You must log in to access this page."
      erb :'users/login'
    end
  end

  # Show show page
  get '/shows/:id' do
    if logged_in?
      # Find show with id matching id url parameter
      @show = Show.find_by_id(params[:id])
      erb :'/shows/display_show'
    else
      flash[:message] = "You must log in to access this page."
      erb :'users/login'
    end
  end

  # Submission of new show form
  post '/shows' do
    # Create show object that belongs to current user
    @show = current_user.shows.build(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
    if @show.save
      redirect to "/shows"
    else
      flash[:message] = @show.errors.full_messages.join(", ")
      erb :'/shows/create_show'
    end
  end

  # Show edit form
  get '/shows/:id/edit' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      # Only allow show to be edited if it belongs to current user
      if @show.user == current_user
        erb :'/shows/edit_show'
      else
        flash[:message] = "You don't have permission to perform this action."
        redirect to '/shows'
      end
    else
      flash[:message] = "You must log in to access this page."
      erb :'users/login'
    end
  end

  # Submission of Show edit form
  patch '/shows/:id' do
    @show = Show.find_by_id(params[:id])
    if @show.update(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
      redirect to "/shows/#{@show.id}"
    else
      flash[:message] = @show.errors.full_messages.join(", ")
      erb :'/shows/edit_show'
    end
  end

  # Delete Show
  delete '/shows/:id/delete' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      # Only allow show to be deleted if it belongs to current user
      if @show.user == current_user
        @show.delete
        flash[:message] = "Show deleted."
        redirect '/shows'
      else
        flash[:message] = "You don't have permission to perform this action."
        redirect '/shows'
      end
    else
      flash[:message] = "You are currently not logged in."
      erb :'users/login'
    end
  end

end
