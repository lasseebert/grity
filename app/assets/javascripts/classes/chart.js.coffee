class @Chart

  constructor: (@element) ->

  plot: (data, options = {}) ->
    options = $.extend true, {}, @default_options(), options
    @element.css("min-height", options["min-height"]) if options["min-height"]
    $.plot(@element, data, options)

  default_options: ->
    {
      "min-height": 400,
      xaxis: {
        mode: "time",
        autoscaleMargin: 0.0001
      },
      series: {
        bars: {
          show: true,
          barWidth: 1000 * 60 * 60 * 24 * 0.8,
          align: "center"
        }
      },
      grid: {
        hoverable: true
      }
    }
