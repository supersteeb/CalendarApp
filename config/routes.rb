Rails.application.routes.draw do


	root 'homes#index'

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

	devise_for :users do
	  get 'sign_in', to: 'devise/sessions#new'
	end

	resources :defaultitems, only: [:create, :destroy, :update] do
		collection do
			get 'toggle/:id', to: 'defaultitems#toggle', as: 'toggle'
		end
	end

  resources :admins, only: [:index] do
  	collection do

  	end
  end
end
