session_key = "grity_session_id"
options = window._grity

track = ->
  session_id = get_session()
  url = "#{options["endpoint"]}api/track.gif?session_id=#{session_id}"
  image = new Image()
  image.src = url

bake_cookie = (name, value) ->
  cookie = "#{name}=#{JSON.stringify(value)}"
  document.cookie = cookie

read_cookie = (name) ->
  result = document.cookie.match(new RegExp(name + '=([^;]+)'))
  result && (result = JSON.parse(result[1]))
  result

get_session = ->
  session_id = read_cookie(session_key)
  if session_id?
    session_id
  else
    session_id = guid()
    bake_cookie(session_key, session_id)
    session_id

s4 = -> Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
guid = -> "#{s4()}#{s4()}-#{s4()}-#{s4()}-#{s4()}-#{s4()}#{s4()}#{s4()}"

track()
