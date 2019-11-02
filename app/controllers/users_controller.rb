class UsersController < ApplicationController
  before_action :set_users

  def index
  end
  
  def show
  end

  def edit
  end

  def method_of_payment
  end

  def set_users
    @user = User.find(1)
  end

end