Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { :registrations => "users/registrations" }
  resources :courses, only: [:index, :show] do
    resources :videos, only: [:show]
    resources :quizzes, only: [:show]
  end
  resources :views, only: [:create]
  
  post '/video/complete' => 'views#complete'
  post '/quiz/skip' => 'quizzes#skip'
  post '/quiz/submit' => 'quizzes#submit'
  get '/quiz/pdf' => 'quizzes#download_pdf'
  get '/video/pdf' => 'videos#download_pdf'
  get '/quiz/audio' => 'quizzes#download_audio'
  get '/video/audio' => 'videos#download_audio'
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
