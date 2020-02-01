class UsersController < ApplicationController

  get "/signup" do
    erb :signup
  end

  get '/login' do
    erb :'login'
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      User.create(email: params[:email], password: params[:password])
      redirect '/login'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/home'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end
