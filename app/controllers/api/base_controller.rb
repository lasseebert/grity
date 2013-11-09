class Api::BaseController < ApplicationController

  skip_before_action :verify_authenticity_token

  def render_ok
    render nothing: true, status: 200
  end
  def render_bad_request
    render nothing: true, status: 400
  end
end
