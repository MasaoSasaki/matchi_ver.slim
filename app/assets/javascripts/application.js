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

// 地図情報取得
$(function() {

  // homes/top.html.erb(:1 JSONタグ)が読み込まれたら現在地を取得開始
  $("#restaurants_json").ready(function() {
    $("#loading").append("(読み込み中)");
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        const CurrentLat = position.coords.latitude;
        const CurrentLng = position.coords.longitude;

        //現在地を地図上に表示
        $(function() {
          map = new google.maps.Map(document.getElementById("map"), {
            center: {lat: CurrentLat, lng: CurrentLng},
            zoom: 13
          });
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(CurrentLat, CurrentLng),
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
                    let lat = result[0].geometry.location.lat();
                    let lng = result[0].geometry.location.lng();
                    marker[i] = new google.maps.Marker({
                      position: new google.maps.LatLng(lat, lng),
                      map: map
                    });
                    i = i + 1;
                    let link = "https://matchi-gourmet/public/restaurants/"+i;
                    i = i - 1;
                    infoWindow[i] = new google.maps.InfoWindow(
                      {
                        content: restaurants[i].name + '<br><a href='+link+'>詳細</a>',
                      },
                    );
                    marker[i].addListener("click", function(){
                      infoWindow[i].open(map, marker[i]);
                    });
                  } else {
                    $(".location-result" + ".error").removeClass("hidden");
                  }
                }
              );
            }
          });
        });
        $("#loading").remove();
      });
    } else {
      $(".location-result" + ".false").removeClass("hidden");
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
                marker[i] = new google.maps.Marker({
                  position: new google.maps.LatLng(lat, lng),
                  map: map
                });
                i = i + 1;
                var link = "https://matchi-gourmet/public/restaurants/"+i;
                i = i - 1;
                infoWindow[i] = new google.maps.InfoWindow(
                  {
                    content: restaurants[i].name + '<br><a href='+link+'>詳細</a>',
                  },
                );
                marker[i].addListener("click", function(){
                  infoWindow[i].open(map, marker[i]);
                });
              } else {
                $(".location-result" + ".error").removeClass("hedden");
              }
            }
          );
        }
      });
      $("#loading").remove();
    }
  });

  // geolocationが使える場合、クリックで地図を表示
  $("#get-position").on("click", function() {
    if (navigator.geolocation) {
      $(".location-result" + ".true").removeClass("hidden");
    }
  });

});

// ヘッダーにスクロール
$(function() {
  $(".move-head").on("click", function(){
    $('body,html').animate({scrollTop:0}, 200, 'swing');
  });
});

// ハンバーガーメニュー
$(function() {
  $(".hamburger").on("click", function() {
    $(this).toggleClass("circle");
    $(".hamburger-menu").toggleClass("menu-hide");
    $(".hamburger-menu").on("click", function() {
      if ($(".hamburger-menu").hasClass("menu-hide")) {
        $(".hamburger-menu").toggleClass("menu-hide");
        $(".hamburger").toggleClass("circle");
      }
    });
  });
});

// メニュータグの追加
$(function() {
  function addTags() {
    var tagName = $("#tag_name").val();
    $("#tag_name").val("");
    $("#tag-list").append(`<span class="menu-tag-list">${tagName} <a href="">x</a></span>`);
    $("#tag-list").append(`<input type="hidden" value="${tagName}" name="tag[]"></input>`);
  }
  // エンターキーを押して追加
  $("#tag_name").keypress(function(key) {
    if (key.which == 13) {
      addTags();
    }
  });
  // 追加ボタンを押して追加
  $(".add-tag-btn").on("click", function() {
    addTags();
  });
});

//メニュー写真、店舗写真にプレビューを表示
$(function() {
  $("#menu_menu_image").on("change", function() {
    console.log("認証")
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $(".image-preview").append(`<img src="${fileReader.result}">`);
    }
    fileReader.readAsDataURL(file);
  });
});
