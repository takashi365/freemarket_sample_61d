class SignupController < ApplicationController
  # before_action :create, only: [:howto_paiement]

  def entry_start
  end

  def member_infomation
    @user = User.new # 新規インスタンス作成
  end

  def phone_number
    session[:nickname] = set_params[:nickname]
    session[:email] = set_params[:email]
    session[:password] = set_params[:password]
    session[:password_confirmation] = set_params[:password_confirmation]
    session[:family_name_kanji] = set_params[:family_name_kanji]
    session[:family_name_kana] = set_params[:family_name_kana]
    session[:first_name_kanji] = set_params[:first_name_kanji]
    session[:first_name_kana] = set_params[:first_name_kana]
    session[:year] = set_params[:year]
    session[:month] = set_params[:month]
    session[:day] = set_params[:day]
    @user = User.new # 新規インスタンス作成
  end

  def sms_check
    @user = User.new # 新規インスタンス作成
  end

  def address_input
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name_kanji: session[:family_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kanji: session[:first_name_kanji],
      first_name_kana: session[:first_name_kana],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      address_attributes: set_params[:address_attributes]
    )
    if @user.save
      session[:id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to cards_path
    else
      redirect_to entry_start_signup_index_path
    end
  end

  def entry_done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def set_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name_kanji,
      :family_name_kana,
      :first_name_kanji,
      :first_name_kana,
      :year,
      :month,
      :day,
      address_attributes:[:id, :post_code, :prefectures, :city, :address, :after_address, :phone_number]
    )
  end
end
