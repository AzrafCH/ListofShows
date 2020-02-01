class UsersController < ApplicationController

  get 'users/signup' do
    erb :signup
  end

  get 'users/login' do
    erb :login
  end

end
