class window.View
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
