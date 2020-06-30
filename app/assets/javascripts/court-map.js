// GoogleMAPを表示させるためのJSです


let map
let geocoder
let marker = []
let infoWindow = []

function initMap(){
  var markerData = #{raw @courts.to_json}

  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  // 初期ポジション
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.6585, lng: 139.7486}, //東京タワー
    zoom: 8
  });

  geocoder.geocode( { 'address': $('#map').attr('class')}, function(results, status) {
    if (status == 'OK') {
      // 繰り返し処理でマーカーと吹き出しを複数表示させる
      for (var i = 0; i < markerData.length; i++) {
        let id = markerData[i]['id']
        map.setCenter(results[0].geometry.location); // map.setCenterで地図が移動

        // 各地点の緯度経度を算出
        markerLatLng = new google.maps.LatLng({
          lat: markerData[i]['latitude'],
          lng: markerData[i]['longitude']
        });

        // 各地点のマーカーを作成
        marker[i] = new google.maps.Marker({
          map: map,
          position: markerLatLng
        });

        // 各地点の吹き出しを作成
        infoWindow[i] = new google.maps.InfoWindow({
          content: `<a href='/courts/${ id }'>${ markerData[i]['name'] }</a>`
        });

        // マーカーにクリックイベントを追加
        markerEvent(i);
      }
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

// マーカーをクリックしたら吹き出しを表示
function markerEvent(i) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i]);
  });
}

// マーカーシングル表示
// function initMap(){
//   // geocoderを初期化
//   geocoder = new google.maps.Geocoder()

//   // 初期ポジション
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: 35.6585, lng: 139.7486}, //東京タワー
//     zoom: 8
//   });

//   geocoder.geocode( { 'address': $('#map').attr('class')}, function(results, status) {
//     if (status == 'OK') {
//       map.setCenter(results[0].geometry.location); // map.setCenterで地図が移動

//       var marker = new google.maps.Marker({
//           map: map, // マーカーの落ちる場所を中心に
//           position: results[0].geometry.location // マーカーを落とす場所
//       });
//     } else {
//       alert('Geocode was not successful for the following reason: ' + status);
//     }
//   });
// }

