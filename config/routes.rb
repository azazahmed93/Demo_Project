Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :movies
  get 'users/all'
  root 'movies#index'
end
