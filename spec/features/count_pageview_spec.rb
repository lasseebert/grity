require 'spec_helper'

describe "javascript track pageview", js: true do

  it "tracks it" do
    visit '/'
    Pageview.count.should == 1
  end
end
