class Pageview
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_agent, type: String
  field :session_id, type: String
  field :host, type: String
  field :url, type: String

  index host: 1

  before_save :set_host

  validate :validate_url
  validates :url, presence: true

  def set_host
    self.host = uri.host
  end

  def validate_url
    valid = uri && uri.kind_of?(URI::HTTP) rescue false
    errors.add :url, "is not valid" unless valid
  end

  def uri
    URI(url)
  end

end
