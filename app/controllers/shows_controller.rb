class ShowsController < ApplicationController

  get '/shows' do
    if logged_in?
      @user = current_user #User.find_by_id(session[:user_id])
      @shows = @user.shows
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
      erb :'/shows/display_show'
    else
      flash[:message] = "You must log in to access this page."
      redirect to '/login'
    end
  end

  post '/shows' do
    if params[:name] == "" || params[:network] == "" || params[:showtime] == "" || params[:weekday] == ""
      flash[:message] = "You left the content field blank. Please try again."
      redirect to '/shows/new'
    else
      @show = current_user.shows.create(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
      @show.save
      redirect to "/shows"
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
    if params[:name] == "" || params[:network] == "" || params[:showtime] == "" || params[:weekday] == ""
      flash[:message] = "You left the content field blank. Please try again."
      redirect "/shows/#{@show.id}/edit"
    else
      @show.update(:name => params[:name], :network => params[:network], :showtime => params[:showtime], :weekday => params[:weekday])
      @show.save
      redirect to "/shows/#{@show.id}"
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
