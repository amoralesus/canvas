class window.Grid
  constructor: (width, height)->
    @increment = 35
    @resetBounds(width, height)

  resetBounds: (width, height) ->
    @width = width
    @height = height

  draw: (ctx) ->
    @ctx = ctx
    @ctx.strokeStyle = '#B5D8EB'
    @ctx.beginPath()
    @drawHorizontalLines()
    @drawVerticalLines()
    @ctx.stroke()

  drawHorizontalLines: ->
    vPosition = 0
    loop
      @drawHorizontalLine(vPosition)
      vPosition += @increment
      break if vPosition > @height

  drawHorizontalLine: (vPosition) ->
    @ctx.moveTo(0,vPosition+0.5)
    @ctx.lineTo(@width, vPosition+0.5)

  drawVerticalLines: ->
    hPosition = 0
    loop
      @drawVerticalLine(hPosition)
      hPosition += @increment
      break if hPosition > @width

  drawVerticalLine: (hPosition, ctx) ->
    @ctx.moveTo(hPosition+0.5, 0)
    @ctx.lineTo(hPosition+0.5, @width)

