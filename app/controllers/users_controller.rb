class UsersController < ApplicationController

  # User Signup
  get '/signup' do
    if !logged_in?
      @user = User.new
      erb :'users/create_user'
    else
      flash[:message] = "You are already logged in. Redirecting to your list of shows."
      redirect to '/shows'
    end
  end

  # Submisstion of User Signup form
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

  # User Login
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      flash[:message] = "You are already logged in. Redirecting to your list of shows."
      redirect to '/shows'
    end
  end

  # Submission of Login form
  post '/login' do
    # Find user in database
    @user = User.find_by(:username => params[:username])
    # Authenticate user password with bcrypt
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.username}."
      redirect to '/shows'
    else
      flash[:message] = "Log in failed. Please try again." # @user.errors.full_messages.join(", ")
      erb :'users/login'
    end
  end

  # User Logout
  get '/logout' do
    session.clear
    erb :'users/login'
  end

end
