Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :users
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
