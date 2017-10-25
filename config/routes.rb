Rails.application.routes.draw do
  root to: 'static_pages#index'
  get 'test', to: 'static_pages#test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests
end
