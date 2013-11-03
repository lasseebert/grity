require 'spec_helper'

describe "javascript track pageview", js: true do

  it "tracks it" do
    visit '/'
    # No workarounds found so far
    sleep 0.1
    Pageview.count.should == 1
    pageview = Pageview.all.first
    pageview.user_agent.should be_present
    pageview.session_id.should be_present
  end

  pending "Get rid of the sleep"

  pending "different sessions" do
    # Should give different session_ids
  end
end
