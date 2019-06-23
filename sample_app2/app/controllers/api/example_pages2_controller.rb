class Api::ExamplePagesController2 < ApplicationController
  def the_good_morning_method
    # response
    # render json: {message: "good morning"}
    render json: { message: "good morning" }
  end
end
