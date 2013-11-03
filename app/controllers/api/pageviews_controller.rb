class Api::PageviewsController < Api::BaseController
  def create
    pageview = Pageview.new pageview_params
    if pageview.save
      render_ok
    else
      render_bad_request
    end
  end

  def pageview_params
    result = params.permit :url
    result[:user_agent] = request.user_agent
    result[:session_id] = request.session_options[:id]
    result
  end
end
