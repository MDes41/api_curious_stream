Rails.application.routes.draw do
	root 'home#index'
	get '/login', to: 'sessions#new'
	get '/logout', to: 'sessions#destroy'
	post '/login', to: 'sessions#create'
	resources :users
end
