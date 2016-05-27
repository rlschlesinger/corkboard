// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/dist/masonry.pkgd
//= require draggabilly/dist/draggabilly.pkgd.js
//= require imagesloaded/imagesloaded.pkgd
//= require bootstrap/dist/js/bootstrap
//= require turbolinks
//= require packery/dist/packery.pkgd.min.js
//= require packery.pkgd
//= require_tree .

$(document).ready(function(){
  $('.grid').imagesLoaded(function() {
    $('.grid').packery({
      itemSelector: '.grid-item',
      // columnWidth helps with drop positioning
    });

    $(".grid").find('.grid-item').each( function( i, gridItem ) {
      var draggie = new Draggabilly( gridItem );
      $(".grid").packery( 'bindDraggabillyEvents', draggie );
    });
  })
});
