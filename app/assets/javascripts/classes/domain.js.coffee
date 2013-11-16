class @Domain

  constructor: (@id) ->

  fetch_stats: ->
    deferred = $.Deferred()
    $.get("/domains/#{@id}/stats").done (response) => deferred.resolve @format_stats(response)
    deferred.promise()

  format_stats: (data) ->
    result = []
    result.push data["total_views"]
    result.push data["unique_views"]
    for series in result
      for point in series
        point[0] = @parse_date(point[0])
    result

  parse_date: (formatted_date) ->
    match = formatted_date.match /(\d{4})-(\d{2})-(\d{2})/
    console.log match
    year = parseInt match[1], 10
    month = parseInt match[2], 10
    day = parseInt match[3], 10
    new Date(year, month - 1, day, 0, 0, 0, 0).getTime()

