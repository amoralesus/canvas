# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Rect
  constructor: (@ctx, @x1, @y1, @x2, @y2) ->

  draw: ->
    @ctx.fillStyle = "rgb(200,0,0)"
    @ctx.fillRect(@x1, @y1, @x2, @y2)

class View
  constructor: ->
    @ctx = $('#view').get(0).getContext('2d')
    @elements = []

  draw: ->
    for i in @elements
      i.draw()

class ViewController
  constructor: ->
    @view = new View
    @ctx = @view.ctx

  addElement: (element) ->
    @view.elements.push element

  draw: ->
    @view.draw()

$(document).ready ->
  viewController = new ViewController
  rect = new Rect(viewController.ctx, 10, 10, 100, 200)
  viewController.addElement(rect)
  viewController.draw()



