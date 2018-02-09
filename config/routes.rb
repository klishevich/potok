Rails.application.routes.draw do
  root to: 'static_pages#index'
  get 'test', to: 'static_pages#test'
  get 'test2', to: 'static_pages#test2'
  get 'test3', to: 'static_pages#test3'
  get 'gmaps', to: 'static_pages#gmaps'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests
end
