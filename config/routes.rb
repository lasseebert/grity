Grity::Application.routes.draw do

  root to: "home#index"

  namespace :api do
    get "track" => "pageviews#track"
  end

end
