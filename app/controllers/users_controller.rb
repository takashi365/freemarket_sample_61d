class UsersController < ApplicationController
  before_action :set_user

  def index
  end
  
  def show
  end

  def edit
  end

  def method_of_payment
  end

  def notification
  end

  def set_user
    @user = User.find(1)
  end

end