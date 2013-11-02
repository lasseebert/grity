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
    params.permit :url, :session_id, :user_agent
  end
end
