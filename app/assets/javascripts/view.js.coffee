class window.View
  constructor: (divId) ->
    @divId = divId
    @elements = []
    @width = $("##{divId}").width()
    @height = $(window).height()


  draw: ->
    stage = new Kinetic.Stage({container: @divId, width: @width, height: @height })
    layer = new Kinetic.Layer()
    for element in @elements
      element.drawOn(layer)
    stage.add layer



