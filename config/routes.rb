Rails.application.routes.draw do
  get 'feed_items/index'
  get 'feed_items/show'
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
