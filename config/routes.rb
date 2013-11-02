Grity::Application.routes.draw do

  root to: "home#index"

  namespace :api do
    resources :pageviews, only: :create
  end

end
