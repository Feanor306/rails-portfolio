Rails.application.routes.draw do
  
  root to: 'pages#home' 				#get 'pages/home'
  get 'about', to: 'pages#about' 		#get 'pages/about'
  get 'contact', to: 'pages#contact'	#get 'pages/contact'

  resources :categories
  resources :blogs

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
 
end
