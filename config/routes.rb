Rails.application.routes.draw do
	root 'to_do_lists#index'
	resources :to_do_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
