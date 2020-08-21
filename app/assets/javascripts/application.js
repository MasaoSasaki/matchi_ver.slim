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
//= require jquery.jpostal
//= require_tree .

//緯度経度から住所を取得
$(function() {
  $("#get-position").on("click", function() {
    if (navigator.geolocation) {
      // 現在地を取得
      console.log("現在地を取得中です。")
      $(".location-result" + ".true").removeClass("hidden");
      navigator.geolocation.getCurrentPosition(function(position) {

        const currentLat = position.coords.latitude;
        const currentLng = position.coords.longitude;
        $("#latitude").text('緯度' + currentLat)
        $("#longitude").text('経度' + currentLng)

        //現在地を地図上に表示
        console.log("地図情報を取得中です。")
        $(function() {
          map = new google.maps.Map(document.getElementById("map"), {
            center: {lat: currentLat, lng: currentLng},
            zoom: 13
          });
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(currentLat, currentLng),
            map: map
          });
          infoWindow = new google.maps.InfoWindow({
            content: "現在地付近"
          });
          marker.addListener("click", function(){
            infoWindow.open(map, marker);
          });

          // レストラン情報を地図上に表示
          const restaurants = gon.restaurants;
          $(function(){
            for (let i = 0; i < restaurants.length; i++) {
              let address = restaurants[i].prefecture + restaurants[i].city + restaurants[i].street;
              const geocoder = new google.maps.Geocoder();
              geocoder.geocode(
                {"address": address},
                function(result, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                    var lat = result[0].geometry.location.lat();
                    var lng = result[0].geometry.location.lng();
                    console.log(address);
                    console.log("緯度経度を取得中です。")

                    console.log(lat)
                    console.log(lng)
                    marker[i] = new google.maps.Marker({
                      position: new google.maps.LatLng(lat, lng),
                      map: map
                    });
                    i = i + 1;
                    var link = "http://localhost:3000/public/restaurants/"+i;
                    i = i - 1;
                    console.log(link)
                    infoWindow[i] = new google.maps.InfoWindow(
                      {
                        content: restaurants[i].name + '<br><a href='+link+'>詳細</a>',
                      },
                    );
                    marker[i].addListener("click", function(){
                      infoWindow[i].open(map, marker[i]);

                    });
                  }
                }
              );
            }
          });
        });
      });
    } else {
      $(".location-result" + ".false").removeClass("hidden");
    }
  });
});

// f.number_field導入のためコメントアウト
// // 入力された数値の自動半角化
// $(function() {
//   $(".number-form").change(function() {
//     let number = $(this).val();
//     number = number.replace( /[０-９]/g, function(s) {
//       return String.fromCharCode(s.charCodeAt(0) - 65248);
//     });
//     // 入力値が無効の場合の処理
//     $(this).val(number);
//     if (isNaN(number)) {
//       $(this).parent().children('span').text("正しい数値が入力されていません。")
//     }
//   }).change();
// });

// let i = 0;
// let weightTime = setInterval(function() {
//     console.log(huga);
//     huga++;
//     //終了条件
//     if (huga == 10) {
//     clearInterval(hoge);
//     console.log("終わり");
//     }
// }, 500);