class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      @user = User.new
      erb :'users/create_user'
    else
      flash[:message] = "You are already logged in. Redirecting to your list of shows."
      redirect to '/shows'
    end
  end

  post '/signup' do
    
    @user = User.new(:username => params[:username], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Thanks for signing up!"
      redirect to '/shows'
    else
      flash[:message] = @user.errors.full_messages.join(", ")
      erb :'users/create_user'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      flash[:message] = "You are already logged in. Redirecting to your list of shows."
      redirect to '/shows'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if params[:username] == "" || params[:password] == ""
      flash[:message] = "Either the username and/or the password wasn't provided. Please try again."
      redirect to '/login'
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.username}."
      redirect to '/shows'
    else
      flash[:message] = "Log in failed. Please try again."
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end

end
