class window.Grid
  constructor: (width, height)->
    @increment = 35
    @resetBounds(width, height)

  resetBounds: (width, height) ->
    @width = width
    @height = height

  drawOn:(layer) ->
    @layer = layer
    @drawHorizontalLines()
    @drawVerticalLines()
    @drawBorder()

  drawHorizontalLines: ->
    vPosition = 0
    loop
      @drawHorizontalLine(vPosition)
      vPosition += @increment
      break if vPosition > @height

  drawHorizontalLine: (vPosition) ->
    line = new Kinetic.Line({points: [0, vPosition+0.5, @width, vPosition+0.5], stroke: '#B5D8EB', strokeWidth: 1})
    @layer.add line

  drawVerticalLines: ->
    hPosition = 0
    loop
      @drawVerticalLine(hPosition)
      hPosition += @increment
      break if hPosition > @width

  drawVerticalLine: (hPosition) ->
    line = new Kinetic.Line({points: [hPosition+0.5, 0, hPosition+0.5, @height], stroke: '#B5D8EB', strokeWidth: 1})
    @layer.add line

  drawBorder: ->
    line = new Kinetic.Line({points: [0,0,0,@height, 0,0,@width,0, @width,0,@width,@height, 0,@height,@width,@height],
    stroke: '#B1B1AF', strokeWidth:2 })
    @layer.add line

