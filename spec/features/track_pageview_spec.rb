require 'spec_helper'

describe "javascript track pageview", js: true do

  it "tracks it" do
    visit '/'
    # No workarounds found so far
    sleep 0.1
    Pageview.count.should == 1
  end

  pending "Get rid of the sleep"

  pending "different sessions" do
    # Should give different session_ids
  end
end
