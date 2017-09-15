Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/video/complete' => 'views#complete'
  post '/quiz/skip' => 'quizzes#skip'
  post '/quiz/submit' => 'quizzes#submit'
  get '/quiz/pdf' => 'quizzes#download_pdf'
  get '/video/pdf' => 'videos#download_pdf'
  devise_for :users, controllers: { :registrations => "users/registrations" }

  resources :courses, only: [:index, :show] do
    resources :videos, only: [:show]
    resources :quizzes, only: [:show]
  end
  resources :views, only: [:create]
  root "home#index"
  # get '/cc' => 'home#cc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
