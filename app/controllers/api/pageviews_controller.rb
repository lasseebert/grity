class Api::PageviewsController < Api::BaseController

  def track
    pageview = Pageview.new pageview_params
    if pageview.save
      render_ok
    else
      render_bad_request
    end
  end

  def pageview_params
    {
      url: request.referer,
      user_agent: request.user_agent
    }
  end
end
