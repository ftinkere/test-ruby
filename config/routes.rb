Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :patients, only: %i[index show] do
    resources :recommendations, only: %i[index]
  end
  resources :consultation_requests, only: %i[index show create] do
    resources :recommendations, only: %i[create]
  end

  get '/test', to: 'recommendations#test'

end
