class SignupController < ApplicationController
  def entry_start
    @user = User.new # 新規インスタンス作成
  end

  def member_infomation
    @user = User.new # 新規インスタンス作成
  end

  def phone_number
    @user = User.new # 新規インスタンス作成
  end

  def sms_check
    @user = User.new # 新規インスタンス作成
  end

  def address_input
    @user = User.new # 新規インスタンス作成
  end

  def howto_paiement
    @user = User.new # 新規インスタンス作成
  end

  def entry_done
    @user = User.new # 新規インスタンス作成
  end
end
