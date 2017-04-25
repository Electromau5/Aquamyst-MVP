$(document).ready(function() {
  $("#c-grid").imagesLoaded(function() {
    $('#c-grid').masonry({
           itemSelector: '#category-box',
           isFitWidth: true,
           isAnimated: !Modernizr.csstransitions
                      	});
                            			});
                  			});