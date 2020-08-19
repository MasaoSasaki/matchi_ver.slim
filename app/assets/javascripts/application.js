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

//緯度経度から住所を取得
$(function() {
  $("#get-position").on("click", function() {
    if (navigator.geolocation) {
      // 緯度経度を取得
      $(".location-result" + ".true").removeClass("hidden");
      navigator.geolocation.getCurrentPosition(function(position) {

        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        $("#latitude").text('緯度' + latitude)
        $("#longitude").text('経度' + longitude)

        $(function() {
          map = new google.maps.Map(document.getElementById("map"), {
          center: {lat: latitude, lng: longitude},
            zoom: 15
          });
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(latitude, longitude),
            map: map
          });
          infoWindow = new google.maps.InfoWindow({
            content: "現在地付近"
          });
          marker.addListener("click", function(){
            infoWindow.open(map, marker);
          });
        });
      });
    } else {
      $(".location-result" + ".false").removeClass("hidden");
    }
  });
});
