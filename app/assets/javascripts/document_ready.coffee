
# every coffee-script class has a window.ClassName so that it is available globally
# hopefully that will not be an issue

$(document).ready ->
  viewController = new ViewController('view')
  viewController.draw()



