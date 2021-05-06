Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :images
  get '/search' => 'images#search', :as => 'search_image'
end
