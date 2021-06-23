Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i(new create destroy)
  resources :questions
  resources :amswers, only: %i(create destroy)
  resources :thank_messages, only: %i(create destroy)
  resources :admin do
    resources :tags, only: %i(new create)
  end
end
