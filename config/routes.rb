Rails.application.routes.draw do
	resources :pic
	root "pics#index"


end
