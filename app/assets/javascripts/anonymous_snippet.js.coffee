$ ->
  url = window.location.origin + window.location.pathname + window.location.search
  $.post('/api/pageviews', { url: url })
