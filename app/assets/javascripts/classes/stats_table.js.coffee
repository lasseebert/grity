class @StatsTable

  constructor: (@element) ->

  render: (data) ->
    @element.html('')
    @add_row row for row in data

  add_row: (row) ->
    row_element = $('<tr>')
    @add_cell row_element, value for value in row
    @element.append row_element

  add_cell: (row_element, value) ->
    cell = $('<td>').text(value)
    row_element.append cell
