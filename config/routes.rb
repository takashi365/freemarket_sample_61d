Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    get 'purchase_page'
    get 'purchase_pay'
    get 'exhibit_ok'
    get 'images_up'
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :users do
    get 'method_of_payment'
    get 'notification'
    get 'todo'
    get 'create_card'
    get 'my_card'
    get 'identification'
    get 'exhibited_items'
    get 'logout'
  end
  resources :signup do
    collection do
      get 'entry_start'
      get 'member_infomation'
      get 'phone_number'
      get 'sms_check' 
      get 'address_input'
      get 'entry_done' 
    end
  end
  resources :cards do
    collection do
      post 'pay' => 'cards#pay', as: 'pay'
    end
  end
end
