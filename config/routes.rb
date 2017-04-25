Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    member do
      post "upvote", to: "votes/upvotes#create"
      post "downvote", to: "votes/downvotes#create"
    end
  end
  resource :sessions, only: [:create, :destroy]
  resources :registrations, only: :create
end
