class @Domain

  constructor: (@id) ->

  fetch_stats: ->
    deferred = $.Deferred()
    $.get("/domains/#{@id}/stats").done (response) => deferred.resolve response
    deferred.promise()

