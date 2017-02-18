class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      flash[:message] = "You are already logged in. Redirecting to your list of shows."
      redirect to '/shows'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      flash[:message] = "Not all required fields were given. Please try again."
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      flash[:message] = "Thanks for signing up!"
      redirect to '/shows'
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

end
