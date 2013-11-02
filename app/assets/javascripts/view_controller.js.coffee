class window.ViewController
  constructor: (divId)->
    @view = new View(divId)
    @grid = new Grid(@view.width(), @view.height())
    @view.addElement(@grid)

  draw: ->
    @view.draw()

  windowResized: ->
    @grid.resetBounds(@view.width(), @view.height())
    @view.draw()

  setHandlers: ->
    $(window).resize =>
      @windowResized()
