Grity::Application.routes.draw do

  root to: "home#index"

  namespace :api do
    get "track" => "pageviews#track"
  end

  get ':hostname' => "hosts#show", as: :host, :constraints => { hostname: /[^\/]+/ }

end
