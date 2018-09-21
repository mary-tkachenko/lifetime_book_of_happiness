Rails.application.routes.draw do
  resources :locations
  root 'welcome#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags', to: 'posts#tags'
  get 'gallery', to: 'posts#gallery'
  get 'book', to: 'posts#book'
  get 'book/year', to: 'posts#book_year'
  get 'book/tag', to: 'posts#book_tag'
  resources :images
  resources :posts
  resources :tags
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
