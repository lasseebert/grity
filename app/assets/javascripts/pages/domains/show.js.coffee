GRITY.register 'domains', 'show', ->
  domain = new Domain($('.domain').data('id'))
  chart = new Chart($('#chart'))

  domain.fetch_stats().done (data) -> chart.plot data
