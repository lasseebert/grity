require 'spec_helper'

describe DomainStats do

  def create_sample_data
    create :pageview, url: "http://fnys.net/about", created_at: Time.now
    create :pageview, url: "http://fnys.net/about", created_at: Time.now
    create :pageview, url: "http://fnys.net/about", created_at: 1.day.ago
    create :pageview, url: "http://fnys.net/page/1", created_at: Time.now
    create :pageview, url: "http://fnys.net/page/1", created_at: 1.day.ago

    create :pageview, url: "http://another.net/page/1", created_at: 1.day.ago
  end

  describe '.by_date' do
    it "gets the correct stats" do
      create_sample_data
      result = DomainStats.by_date Domain.get 'fnys.net'

      result.length.should == 2
      result[0][1].should == 2
      result[1][1].should == 3
    end
  end

  describe ".by_url" do
    it "get the correct stats" do
      create_sample_data
      result = DomainStats.by_url Domain.get 'fnys.net'

      result.length.should == 2
      result[0].should == ["http://fnys.net/about", 3]
      result[1].should == ["http://fnys.net/page/1", 2]
    end

    it "do not differ with trailing slashes" do
      create :pageview, url: "http://fnys.net/about"
      create :pageview, url: "http://fnys.net/about/"
      result = DomainStats.by_url Domain.get 'fnys.net'
      result.length.should == 1
    end
  end
end
