require 'spec_helper'

describe DomainStats do
  describe '.get' do
    it "gets the correct stats" do
      create :pageview, url: "http://fnys.net/about", session_id: "1", created_at: Time.now
      create :pageview, url: "http://fnys.net/about", session_id: "1", created_at: Time.now
      create :pageview, url: "http://fnys.net/about", session_id: "1", created_at: 1.day.ago
      create :pageview, url: "http://fnys.net/page/1", session_id: "1", created_at: Time.now
      create :pageview, url: "http://fnys.net/page/1", session_id: "1", created_at: 1.day.ago

      result = DomainStats.get(Domain.get('fnys.net'), 2)

      result.should =~ [
        [ [1, 2], [2, 3] ],
        [ [1, 2], [2, 2] ]
      ]

    end
  end
end
