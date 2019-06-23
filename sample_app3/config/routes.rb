Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # namespace :api do
  #   # route (chrome)             controller        method name (goes in controller)
  #   get '/good_morning' => 'example_pages#the_good_morning_method'
  # end
  namespace :api do
    # route (chrome)             controller        method name (goes in controller)
    get '/good_morning' => 'example_pages3#the_good_morning_method'
    get '/good_evening' => 'example_pages3#the_good_evening_method'
    get '/good_night' => 'example_pages3#the_good_night_method'
  end

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
end
