GRITY.register 'domains', 'show', ->
  domain = new Domain($('.domain').data('id'))
  chart = new Chart($('#chart'))

  chart.plot domain.fetch_stats()
