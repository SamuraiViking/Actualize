class Api::RecipesController < ApplicationController
  def the_recipe
    render 'reci.json.jb'
  end
end
