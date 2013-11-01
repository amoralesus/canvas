class window.ViewController
  constructor: (divId)->
    @view = new View(divId)
    @grid = new Grid(@view.width, @view.height)
    @addElement(@grid)

  addElement: (element) ->
    @view.elements.push element

  draw: ->
    @view.draw()

  windowResized: ->
    @view.resetBounds()
    @grid.resetBounds(@view.width, @view.height)
    @view.draw()

  setHandlers: ->
    $(window).resize =>
      @windowResized()

    $('#new_line_button').click =>
      x1 = $('#x1').val()
      y1 = $('#y1').val()
      x2 = $('#x2').val()
      y2 = $('#y2').val()
      line = new Line(x1, y1, x2, y2)
      @addElement(line)
      false
