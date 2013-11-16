class Domain
  include Mongoid::Document
  include Mongoid::Timestamps

  field :host

  def self.get(host)
  end
end
