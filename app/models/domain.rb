class Domain
  include Mongoid::Document
  include Mongoid::Timestamps

  field :host

  validates :host, presence: true, uniqueness: true

  index({ host: 1 }, { unique: true })

  def self.get(host)
    find_by host: host
  rescue
    create_if_stats_exists(host) || raise
  end

  def self.first_by_host(host)
    where(host: host).first
  end

  def self.create_if_stats_exists(host)
    if Pageview.where(host: host).any?
      Domain.create! host: host
    else
      nil
    end
  end

end
