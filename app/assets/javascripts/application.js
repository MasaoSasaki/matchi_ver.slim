// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require_tree .

$(function() {
  $("#get-position").on("click", function() {
    if (navigator.geolocation) {
      $(".location-result" + ".true").removeClass("hidden");
      navigator.geolocation.getCurrentPosition(function(position) {

        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        $("#latitude").text('緯度'+latitude)
        $("#longitude").text('経度'+longitude)

      });
    } else {
      $(".location-result" + ".false").removeClass("hidden");
    }
  });
});