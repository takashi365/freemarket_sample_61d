Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/index'
  resources :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'step5'
      get 'step6'
      get 'done' 
    end
  end
end
