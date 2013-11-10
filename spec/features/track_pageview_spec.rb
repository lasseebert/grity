require 'spec_helper'

describe "javascript track pageview", js: true do

  def wait_for_page_track(&block)
    start = Time.now
    timeout = 2.seconds
    count = Pageview.count
    yield
    while Time.now - start < timeout do
      sleep 0.01
      return if Pageview.count > count
    end
    raise "Timeout waiiting for pageview"
  end

  it "tracks it" do
    wait_for_page_track do
      visit '/'
    end
    Pageview.count.should == 1

    pageview = Pageview.first
    pageview.url.should be_present
    pageview.user_agent.should be_present
    pageview.session_id.should be_present
  end

  context "two views in same session" do
    it "tracks with same session_id" do
      2.times do
        wait_for_page_track do
          visit '/'
        end
      end
      Pageview.all[0].session_id.should == Pageview.all[1].session_id
    end
  end
  context "twi views in different sessions" do
    it "tracks with different session ids" do
      2.times do
        wait_for_page_track do
          Capybara::Session.new(Capybara.current_driver, Capybara.app).visit '/'
        end
      end
      Pageview.all[0].session_id.should_not == Pageview.all[1].session_id
    end
  end
end
