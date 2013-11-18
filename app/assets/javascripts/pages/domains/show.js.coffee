GRITY.register 'domains', 'show', ->
  domain = new Domain($('.domain').data('id'))
  chart = new Chart($('#chart'))
  table = new StatsTable($('#stats-table'))

  domain.fetch_stats().done (data) ->
    chart.plot [data.by_date]
    table.render data.by_url
