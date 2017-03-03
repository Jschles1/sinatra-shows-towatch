class ShowsController < ApplicationController

  get '/shows' do
    if logged_in?
      @user = current_user
      @shows = @user.shows #Show.all.find{|show| current_user.id == show.user_id }#Find where current_user.id == show.user_id or cuurent_user.shows
      erb :'/shows/shows'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  get '/shows/new' do
    if logged_in?
      @show = Show.new
      erb :'/shows/create_show'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  get '/shows/:id' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      erb :'/shows/display_show'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  post '/shows' do
    @show = current_user.shows.new(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
    if @show.save
      redirect to "/shows"
    else
      flash[:message] = @show.errors.full_messages.join(", ")
      erb :'/shows/create_show'
    end
  end

  get '/shows/:id/edit' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      if @show.user_id == current_user.id
        erb :'/shows/edit_show'
      else
        flash[:message] = "You don't have permission to perform this action."
        redirect to '/shows'
      end
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  patch '/shows/:id' do
    @show = Show.find_by_id(params[:id])
    @show.update(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
    if @show.save
      redirect to "/shows/#{@show.id}"
    else
      flash[:message] = @show.errors.full_messages.join(", ")
      erb :'/shows/edit_show'
    end
  end

  delete '/shows/:id/delete' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      if @show.user_id == current_user.id
        @show.delete
        flash[:message] = "Show deleted."
        redirect '/shows'
      else
        flash[:message] = "You don't have permission to perform this action."
        redirect '/shows'
      end
    else
      flash[:message] = "You are currently not logged in."
      redirect '/login'
    end
  end

end
