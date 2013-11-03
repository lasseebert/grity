$ ->
  url = window.location.origin + window.location.pathname + window.location.search
  $.post('/api/pageviews', { session_id: "42", url: url })
