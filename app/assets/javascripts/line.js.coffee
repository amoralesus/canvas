class window.Line
  constructor: (@x1,@y1,@x2,@y2)->

  draw: (ctx) ->
    ctx.strokeStyle = '#183D66'
    ctx.beginPath()
    ctx.moveTo(@x1,@y1)
    ctx.lineTo(@x2,@y2)
    ctx.stroke


