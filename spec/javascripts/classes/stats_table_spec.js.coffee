#= require classes/stats_table

describe 'StatsTable', ->

  describe "#constructor", ->
    it "it should set element", ->
      element = "foo"
      subject = new StatsTable(element)
      expect(subject.element).toBe element

  describe "#add_cell", ->
    it "should add cell with correct content", ->
      row = $('<tr>')
      value = "foo"
      table = new StatsTable(null)
      table.add_cell row, value
      expect(row.html()).toBe "<td>foo</td>"

    it "should make links from url", ->
      row = $('<tr>')
      value = "http://grity.org"
      table = new StatsTable(null)
      table.add_cell row, value
      expect(row.html()).toBe '<td><a href="http://grity.org">http://grity.org</a></td>'

