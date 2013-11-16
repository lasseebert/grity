Grity::Application.routes.draw do

  root to: "home#index"

  namespace :api do
    get "track" => "pageviews#track"
  end

  get ':host' => "domains#show", as: :domain, :constraints => { host: /[^\/]+/ }

end
