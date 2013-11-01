class window.View
  constructor: ->
    @resetBounds()
    @elements = []

  canvas: ->
    $('#view').get(0)

  ctx: ->
    @canvas().getContext('2d')

  resetBounds: ->
    @width = $('#view').width()
    @height = $('#view').height()
    @canvas().width = @width
    @canvas().height = @height

  draw: ->
    for i in @elements
      i.draw(@ctx())
