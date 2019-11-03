Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    get 'purchase_page'
  end
  resources :users do
    get 'method_of_payment'
    get 'notification'
  end
  resources :signup do
    collection do
      get 'entry_start'
      get 'member_infomation'
      get 'phone_number'
      get 'sms_check' 
      get 'address_input'
      get 'howto_paiement'
      get 'entry_done' 
    end
  end
end
