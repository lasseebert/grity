class @Chart

  constructor: (@element) ->

  plot: (data, options = {}) ->
    options = $.extend true, {}, @default_options(), options
    @element.css("min-height", options["min-height"]) if options["min-height"]
    $.plot(@element, data, options)

  default_options: ->
    {
      "min-height": 400
    }
