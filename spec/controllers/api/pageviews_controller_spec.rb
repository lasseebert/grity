require 'spec_helper'

describe Api::PageviewsController do

  describe "track" do
    it "creates the pageview" do
      get :track
      response.should be_success
      Pageview.count.should == 1
    end
  end

end
