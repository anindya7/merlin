Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/mercmerc', as: 'rails_admin'
  root :to => redirect('/users/sign_in')
  devise_for :users, controllers: { :registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => 'users/sessions' }
  devise_scope :user do
    authenticated :user do
      root 'courses#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
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
  post '/checkuser', to: 'home#checkuser'
  get '/research' => 'home#research'  
  get '/merc/sign_in' => 'home#admin_signin' # Admin Sign in
  match '/paytm_payment' => 'paytm#start_payment', via: [:post], :as => :paytm_payment
  match '/confirm_payment' => 'paytm#verify_payment', via: [:post]
  # root "home#index"

  # root :to => 'users/registrations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
