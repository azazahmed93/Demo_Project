Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  resources :actors
  resources :users, only: [:index]
  resources :reports, only: [:index, :destroy, :new, :create]
  get 'reviews/all'
  get 'movies/home'
  root 'movies#home'
end
