Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  post '/rate', to: 'rater#create', as: :rate

  devise_for :users


  get 'users/add_follower'
  get 'users/remove_follower'

  namespace 'api' do
    devise_for :users
    resources :movies, only: [:index, :show, :search] do
      collection do
        get 'search'
      end
    end
  end
    resources :movies do
      collection do
        get 'search'
        delete 'unfavorite'
      end
      resources :reviews, except: [:show, :index] do
      end
    end


  resources :actors
  resources :users, only: [:index]
  resources :reports, only: [:index, :destroy, :new, :create]

  delete 'users/destroy'
  post 'movies/favoritize'
  get  'users/profile'
  get  'reviews/all'
  get  'movies/home'
  root 'movies#home'
end
