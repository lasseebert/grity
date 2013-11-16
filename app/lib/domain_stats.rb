class DomainStats

  def self.get(domain, days)
    data = Pageview.where(host: domain.host).all.to_a
    {
      total_views: total_views(data),
      unique_views: unique_views(data)
    }
  end

  def self.total_views(data)
    data.group_by { |pageview| pageview.created_at.to_date }.sort.map { |date, data|  [date, data.length] }
  end

  def self.unique_views(data)
    data.group_by { |pageview| pageview.created_at.to_date }.sort.map { |date, data|  [date, data.length] }
  end

end
