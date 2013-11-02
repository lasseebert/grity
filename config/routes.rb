Grity::Application.routes.draw do

  namespace :api do
    resources :pageviews, only: :create
  end

end
