Rails.application.routes.draw do
  resources :categories
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :portfolios
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
