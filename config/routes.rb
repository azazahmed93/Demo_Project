Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  post '/rate', to: 'rater#create', as: :rate

  devise_for :users

  namespace 'api' do
    devise_for :users
    resources :movies, only: [:index, :show, :search]
  end
    resources :movies do
      collection do
        get 'search'
      end
      resources :reviews, except: [:show, :index] do
      end
    end


  resources :actors
  resources :users, only: [:index]
  resources :reports, only: [:index, :destroy, :new, :create]

  post 'movies/favoritize'
  get  'users/profile'
  get  'reviews/all'
  get  'movies/home'
  root 'movies#home'
end
