require 'spec_helper'

describe "routes to hosts" do
  describe "show" do
    it "routes to host by hostname" do
      expect(get: "/www.mydomain.com").to route_to(
        controller: "hosts",
        action: "show",
        hostname: "www.mydomain.com"
      )
    end

  end
end
