Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    sign_up: 'register' }

  root to: 'pages#home' 				#get 'pages/home'

  get 'about', to: 'pages#about' 		#get 'pages/about'
  get 'contact', to: 'pages#contact'	#get 'pages/contact'
  get 'tech-news', to: 'pages#tech_news'

  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  #resources :comments
  #resources :categories
  
  resources :topics, only: [:index, :show]

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  resources :blogs do 
  	member do
  	  get :toggle_status
  	end
  end
 
end
