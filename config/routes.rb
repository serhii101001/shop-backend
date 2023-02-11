Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :communities, only: %i[index create show update] do
        resources :posts, only: %i[create]
        resource :memberships, only: %i[create destroy]
      end

      resources :posts, only: %i[index show update destroy] do
        resources :comments, only: %i[index create]
        resources :votes, only: %i[create destroy]
      end

      resources :comments, only: %i[update] do
        resource :comments, only: %i[create]
        resources :votes, only: %i[create]
      end

      resources :votes, only: %i[destroy]
    end
  end
end
