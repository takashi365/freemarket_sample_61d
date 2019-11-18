class UsersController < ApplicationController
  before_action :set_user

  def index
  end
  
  def show
  end

  def edit
  end

  def logout
  end

  def method_of_payment
  end

  def notification
  end

  def todo
  end

  def create_card
  end

  def my_card
  end

  def identification
  end

  def set_user
    @user = User.all
  end

end