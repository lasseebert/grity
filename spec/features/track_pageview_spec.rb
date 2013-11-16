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
  end
end
