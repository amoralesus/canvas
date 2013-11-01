
# not sure if this should be in the index page itself
# for now we only have home#index and we will base it all
# from there. 
# at some point we will need something like spine.js
# but let's see how far we can go just with the default
# rails javascript functionality
#
# every coffee-script class has a window.ClassName so that it is available globally
# hopefully that will not be an issue

$(document).ready ->
  viewController = new ViewController
  viewController.draw()

  $(window).resize ->
    viewController.windowResized()

