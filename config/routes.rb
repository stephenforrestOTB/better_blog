Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/show", to: "posts#show"
  get "/posts/index", to: "posts#index"
  get '/posts/new', to: "posts#new"
  post '/posts', to: "post#create"
end
