Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :movies
  get 'users/all'
  get 'movies/home'
  root 'movies#home'
end
