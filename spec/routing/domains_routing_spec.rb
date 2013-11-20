require 'spec_helper'

describe "routes to domains" do
  describe "show" do
    it "routes to host by hostname" do
      expect(get: "/www.mydomain.com").to route_to(
        controller: "domains",
        action: "show",
        hostname: "www.mydomain.com"
      )
    end

  end
end
