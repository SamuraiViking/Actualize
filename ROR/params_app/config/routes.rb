Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/query_url' => 'params#query_url'

    # body parameter
    post '/body_parameter_url' => 'params#body_param_action'
  end
end
