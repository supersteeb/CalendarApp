Rails.application.routes.draw do
  devise_for :users
  get 'admins/index'

	root 'todolists#index'
	resources :todolists do
		collection do
			post 'create_item', to: 'todolists#create_todoitem'
		end
	end
	resources :todoitems do
		collection do
			get 'toggle_status/:id', to: 'todoitems#toggle_status', as: 'toggle'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
