class Api::ParamsController < ApplicationController
  def query_url
    @champion = params['champion']
    render 'query_url.json.jb'
  end

  def body_param_action
    @name = params['first']
    render 'body.json.jb'
  end
end
