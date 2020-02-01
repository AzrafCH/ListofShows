class UsersController < ApplicationController

  get '/users/signup' do
    erb :'/users/signup'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect 'users/signup'
    else
      User.create(email: params[:email], password: params[:password])
      redirect 'users/login'
    end
  end

  post '/users/login' do
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
