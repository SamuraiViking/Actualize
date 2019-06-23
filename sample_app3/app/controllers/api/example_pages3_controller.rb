class Api::ExamplePages3Controller < ApplicationController
  def the_good_morning_method
    # response
    # render json: {message: "good morning"}
    render json: { message: "good morning" }
  end

  def the_good_evening_method
    # response
    # render json: {message: "good evening"}
    render json: { message: "good evening" }
  end

  def the_good_night_method
    # response
    # render json: {message: "good night"}
    render json: { message: "good night" }
  end
end
