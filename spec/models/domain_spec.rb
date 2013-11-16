require 'spec_helper'

describe Domain do

  describe "validation" do
    it "should have unique host" do
      create :domain, host: "foo"
      build(:domain, host: "foo").should_not be_valid
    end
  end

  describe '.get' do
    subject { Domain.get host }
    let(:host) { "fnys.net" }

    context "host exists" do
      let!(:domain) { create :domain, host: host }
      it { should == domain }
    end

    context "stats exists" do
      before { create :pageview, url: "http://#{host}/about" }
      it { should be_present }
    end

    context "nothing exists" do
      it { should be_nil }
    end
  end
end
