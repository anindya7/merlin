Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/video/complete' => 'views#complete'
  devise_for :users
  resources :courses, only: [:index, :show] do
    resources :videos, only: [:show]
  end
  resources :views, only: [:create]
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
