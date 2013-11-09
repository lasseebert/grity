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
    pageview.session_id.should be_present
  end

  pending "Get rid of the sleep"

  context "two views in same session" do
    it "tracks with same session_id" do
      visit '/'
      visit '/'
      sleep 0.1
      Pageview.all[0].session_id.should == Pageview.all[1].session_id
    end
  end
  context "twi views in different sessions" do
    it "tracks with different session ids" do
      Capybara::Session.new(Capybara.current_driver, Capybara.app).visit '/'
      Capybara::Session.new(Capybara.current_driver, Capybara.app).visit '/'
      sleep 0.1
      Pageview.all[0].session_id.should_not == Pageview.all[1].session_id
    end
  end
end
