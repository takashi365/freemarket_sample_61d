class UsersController < ApplicationController
  def index
    @user = User.find(1)
  end
  def show
    @user = User.find(1)
  end
end