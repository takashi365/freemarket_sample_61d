class CardsController < ApplicationController
  def index
  end

 def create
    @user_id = session[:id]
    Payjp.api_key = "sk_test_1d1c3a9fc93711a1a4065fd5"
    if params['payjpToken'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
        redirect_to action: "index"
    else
        customer = Payjp::Customer.create(
        card: params['payjpToken'],
        )
       # ↑ここでjay.jpに保存
        @card = Card.new(user_id: @user_id, customer_id: customer.id, customer_card: customer.default_card)
       # ここでdbに保存
        if @card.save
          redirect_to entry_done_signup_index_path
          flash[:notice] = 'クレジットカードの登録が完了しました'
        else
          redirect_to action: "create"
          flash[:alert] = 'クレジットカード登録に失敗しました'
        end
    end
  end
end
