Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :movies
  get 'users/all'
  root 'movies#index'
end
