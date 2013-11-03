require 'spec_helper'

describe Api::PageviewsController do

  describe "create" do
    it "creates the pageview" do
      post :create, session_id: "42", url: "http://mysite.com/super?super=true"
      response.should be_success

      pageview = Pageview.first
      pageview.user_agent.should be_present
      pageview.session_id.should == "42"
      pageview.url.should == "http://mysite.com/super?super=true"
      pageview.host.should == "mysite.com"

    end
  end

end
