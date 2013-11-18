class DomainStats

  def self.by_date(domain)
    Pageview.where(host: domain.host).map_reduce(map, reduce).out(inline: 1).map do |row|
      [row["_id"]["day"], row["value"]["count"].to_i]
    end.sort
  end

  def self.by_url(domain)
    result = Pageview.where(host: domain.host).map_reduce(
      "function() { emit({ url: this.url }, { count: 1 }); }",
      reduce
    ).out(inline: 1).to_a

    result.map! { |row| [ row["_id"]["url"], row["value"]["count"] ] }
    result.sort_by! { |point| -point[1] }
    result
  end

  def self.map
    <<-EOF
      function() {
        day = Date.UTC(this.created_at.getFullYear(), this.created_at.getMonth(), this.created_at.getDate());
        emit({ day: day }, { count: 1 });
      }
    EOF
  end

  def self.reduce
    <<-EOF
      function(key, values) {
        var count = 0;
        values.forEach(function(v) {
          count += v['count'];
        });
        return { count: count };
      }
    EOF
  end

end
