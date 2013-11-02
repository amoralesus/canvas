class window.View
  constructor: (divId) ->
    @divId = divId
    @elements = []

  addElement: (element) ->
    @elements.push element

  width: ->
    $("##{@divId}").width()

  height: ->
    $(window).height()

  draw: ->
    stage = new Kinetic.Stage({container: @divId, width: @width(), height: @height() })
    layer = new Kinetic.Layer()
    for element in @elements
      element.drawOn(layer)
    stage.add layer



