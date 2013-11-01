class window.ViewController
  constructor: ->
    @view = new View
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
