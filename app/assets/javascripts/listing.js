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
    zoomType: "inner",
    responsive: true,
    borderSize: 1,
    cursor: 'crosshair',
    galleryActiveClass: 'active',
    imageCrossfade: true
  });
});

Turbolinks.cacheCurrentPage();

