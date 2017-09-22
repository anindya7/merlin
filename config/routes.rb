Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/mercmerc', as: 'rails_admin'
  devise_for :users, controllers: { :registrations => "users/registrations" }
  devise_scope :user do
    authenticated :user do
      root 'courses#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :courses, only: [:index, :show] do
    resources :videos, only: [:show]
    resources :quizzes, only: [:show]
  end
  resources :views, only: [:create]
  
  post '/video/complete' => 'views#complete'
  post '/quiz/skip' => 'quizzes#skip'
  post '/quiz/submit' => 'quizzes#submit'
  get '/quiz/pdf' => 'quizzes#download_pdf'
  get '/video/:id/pdf' => 'videos#download_pdf', as: 'video_pdf'
  get '/quiz/audio' => 'quizzes#download_audio'
  get '/video/audio' => 'videos#download_audio'
  get '/refer' => 'home#refer'
  post '/refer' => 'home#submit_refer'
  # root "home#index"
  # root :to => 'users/registrations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
