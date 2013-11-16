class DomainStats

  def self.get(domain, days)
    Pageview.map_reduce(map, reduce).out(inline: 1).map do |row|
      [row["_id"]["day"], row["value"]["count"].to_i]
    end
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
