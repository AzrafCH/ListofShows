class UsersController < ApplicationController

  get 'users/signup' do
    erb :signup
  end

  get 'users/login' do
    erb :login
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect 'users/signup'
    else
      User.create(email: params[:email], password: params[:password])
      redirect 'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[password])
      session[:user_id] = @user.id
      redirect 'users/home'
    else
      redirect 'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end
