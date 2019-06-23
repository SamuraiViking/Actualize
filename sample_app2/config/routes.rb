Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    # route (chrome)             controller        method name (goes in controller)
    get '/good_morning' => 'example_pages2#the_good_morning_method'
  end

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
end
