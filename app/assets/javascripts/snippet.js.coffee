options = window._grity

track = ->
  url = "#{options["endpoint"]}api/track.gif"
  image = new Image()
  image.src = url

track()
