class Pageview
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_agent, type: String
  field :session_id, type: String
  field :host, type: String
  field :url, type: String

  index host: 1

end
