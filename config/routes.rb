Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :movies do 
      resources :movie_actors
    end
    
    resources :users
    resources :sessions
    resources :favorite_movies
    resources :reviews
end
