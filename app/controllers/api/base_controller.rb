class Api::BaseController < ApplicationController
  def render_ok
    render nothing: true, status: 200
  end
  def render_bad_request
    render nothing: true, status: 400
  end
end
