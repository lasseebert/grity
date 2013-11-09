require 'spec_helper'

describe "javascript track pageview", js: true do

  def wait_for_page_track
    # No workarounds found so far
    sleep 0.1
  end

  it "tracks it" do
    visit '/'
    wait_for_page_track
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
      wait_for_page_track
      Pageview.all[0].session_id.should == Pageview.all[1].session_id
    end
  end
  context "twi views in different sessions" do
    it "tracks with different session ids" do
      Capybara::Session.new(Capybara.current_driver, Capybara.app).visit '/'
      Capybara::Session.new(Capybara.current_driver, Capybara.app).visit '/'
      wait_for_page_track
      Pageview.all[0].session_id.should_not == Pageview.all[1].session_id
    end
  end
end
