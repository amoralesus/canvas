class Grid
  constructor: (width, height)->
    @increment = 10
    @resetBounds(width, height)

  resetBounds: (width, height) ->
    @width = width
    @height = height

  draw: (ctx) ->
    @ctx = ctx
    @ctx.strokeStyle = '#B4D6D7'
    @ctx.beginPath()
    @drawHorizontalLines()
    @drawVerticalLines()
    @ctx.stroke()

  drawHorizontalLines: ->
    vPosition = 0
    loop
      @drawHorizontalLine(vPosition)
      vPosition += 40
      break if vPosition > @height

  drawHorizontalLine: (vPosition) ->
    @ctx.moveTo(0,vPosition+0.5)
    @ctx.lineTo(@width, vPosition+0.5)

  drawVerticalLines: ->
    hPosition = 0
    loop
      @drawVerticalLine(hPosition)
      hPosition += 40
      break if hPosition > @width

  drawVerticalLine: (hPosition, ctx) ->
    @ctx.moveTo(hPosition+0.5, 0)
    @ctx.lineTo(hPosition+0.5, @width)


class View
  constructor: ->
    @resetBounds()
    @elements = []

  canvas: ->
    $('#view').get(0)

  ctx: ->
    @canvas().getContext('2d')

  # for now just make the view the window size
  resetBounds: ->
    @width = $(window).width()
    @height = $(window).height()
    @canvas().width = @width
    @canvas().height = @height

  draw: ->
    for i in @elements
      i.draw(@ctx())

class ViewController
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

$(document).ready ->
  viewController = new ViewController
  viewController.draw()

  $(window).resize ->
    viewController.windowResized()
 
    


