Rails.application.routes.draw do
  get 'users/index'
  get 'users/import'
	root to: "users#index"
	
	get 'users/index'
	
	get 'users/import' => 'users#my_import'
	
	resources :users do
		collection {post :import}
	end
end
