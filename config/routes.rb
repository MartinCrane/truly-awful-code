Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    member do
      post "upvote", to: "votes#upvote"
      post "downvote", to: "votes#downvote"
    end
  end
  resource :sessions, only: [:create, :destroy]
  resources :registrations, only: :create
end
