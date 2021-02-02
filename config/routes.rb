Rails.application.routes.draw do
  
  root to: 'pages#home' 				#get 'pages/home'
  get 'about', to: 'pages#about' 		#get 'pages/about'
  get 'contact', to: 'pages#contact'	#get 'pages/contact'

  resources :categories
  resources :portfolios
  resources :blogs
 
end
