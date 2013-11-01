

class Grid
  constructor: (@width, @height, @ctx)->
    @increment = 10
    @setLineColor()

  setLineColor: ->
    @ctx.strokeStyle = '#B4D6D7'

  draw: ->
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

  drawVerticalLine: (hPosition) ->
    @ctx.moveTo(hPosition+0.5, 0)
    @ctx.lineTo(hPosition+0.5, @width)


class View
  constructor: (@width, @height) ->
    @canvas = $('#view').get(0)
    @canvas.width = @width
    @canvas.height = @height
    @ctx = @canvas.getContext('2d')
    @elements = []

  draw: ->
    for i in @elements
      i.draw()

class ViewController
  constructor: ->
    @view = new View($(window).width(), $(window).height())
    @ctx = @view.ctx
    @grid = new Grid(@view.width, @view.height, @ctx)
    @addElement(@grid)

  addElement: (element) ->
    @view.elements.push element

  draw: ->
    @view.draw()

$(document).ready ->
  viewController = new ViewController
  viewController.draw()



