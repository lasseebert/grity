require 'spec_helper'

describe Pageview do
  describe "validation" do

    describe "url" do
      invalid_urls = ["noprotocol.com", "", nil]
      invalid_urls.each do |invalid_url|
        it "should not be valid with url #{invalid_url.inspect}" do
          build(:pageview, url: invalid_url).should_not be_valid
        end
      end

      valid_urls = ["http://mysite.com", "http://mysite.com/", "http://mysite.com/?", "http://mysite.com?page=5", "http://mysite.com/lala?page=42"]
      valid_urls.each do |url|
        it "should be valid with url #{url.inspect}" do
          build(:pageview, url: url).should be_valid
        end
      end
    end

  end

  describe "host" do
    subject { create(:pageview, url: url).host }
    context "no subdomain" do
      let(:url) { "http://mysite.com/lala" }
      it { should == "mysite.com" }
    end
    context "subdomain" do
      let(:url) { "http://my.site.com/lala" }
      it { should == "my.site.com" }
    end
  end
end
