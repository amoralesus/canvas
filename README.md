Canvas
======

Playing with the canvas object in HTML5

This is a Rails app mainly because we already have haml, coffee-script and a way to display this.

Depending how far I take this, if I need to persist any of this, I have a whole database elegant back-end.

### What it does now
This app currently draws a grid with the size of the window.

### MVC
Trying to start separating everything from the beginning. The file shows how classes can be defined
with coffee-script to help with the canvas drawing. Using the ViewController and View paradigm that 
cocoa uses.


``` coffee-script


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



```


