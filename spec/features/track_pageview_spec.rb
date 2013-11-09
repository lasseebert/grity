require 'spec_helper'

describe "javascript track pageview", js: true do

  it "tracks it" do
    visit '/'
    # No workarounds found so far
    sleep 0.1
    Pageview.count.should == 1

    pageview = Pageview.first
    pageview.url.should be_present
    pageview.user_agent.should be_present
  end

  pending "Get rid of the sleep"
end
