Grity::Application.routes.draw do

  root to: "home#index"

  namespace :api do
    get "track" => "pageviews#track"
  end

  resources :domains, only: [] do
    member do
      get :stats
    end
  end

  get ':host' => "domains#show", as: :domain, :constraints => { host: /[^\/]+/ }

end
