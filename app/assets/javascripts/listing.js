$(window).load(function(){
        $('#myModal').modal('show');
    });


$(document).ready(function() {
  $("#grid").imagesLoaded(function() {
    $('#grid').masonry({
           itemSelector: '#listing-box',
           isFitWidth: true,
           isAnimated: !Modernizr.csstransitions
                      });
                            });
                  });
$(function() {
  return $('.zoom').elevateZoom({
    gallery: 'gallery',
    zoomType: 'inner',
    lesSize: 200,
    responsive: true,
    borderSize: 1,
    cursor: 'cursor',
    galleryActiveClass: 'active',
    imageCrossfade: true
  });
});

Turbolinks.cacheCurrentPage();

