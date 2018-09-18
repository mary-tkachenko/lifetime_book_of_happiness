Rails.application.routes.draw do
  root 'welcome#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags', to: 'posts#tags'
  resources :clouds
  resources :images
  resources :posts
  resources :tags
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
