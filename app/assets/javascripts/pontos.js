//= require markerwithlabel
//= require_self


var geocoder;
var map;
function initMap() {
    var latlng = new google.maps.LatLng(ponto.latitude, ponto.longitude);

    var options = {
        zoom: 5,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("mapa"), options);
    geocoder = new google.maps.Geocoder();
    if(ponto){
      plotPonto(ponto);
    }
    
    for(i = 0; i< locais.length; i++){
        plotLocalDeTrabalho(locais[0]);
    }    
}

function plotPonto(p){
    var ponto_map;
    var latlng = new google.maps.LatLng(p.latitude, p.longitude);
    ponto_map = new MarkerWithLabel({
        map: map,
        draggable: false,
                 labelContent: "Local do ponto",
   labelAnchor: new google.maps.Point(22, 0),
   labelClass: "label-marker", // the CSS class for the label
   icon: {}
    });
  ponto_map.setPosition(latlng);
  circle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,

      radius: parseInt(p.raio)
    }); 
    circle.bindTo('center', ponto_map, 'position');
    
    map.setCenter(ponto_map);
    map.setZoom(16);
}

function plotLocalDeTrabalho(l){
     var local_map;
    var latlng = new google.maps.LatLng(l.latitude, l.longitude);
    local_map= new MarkerWithLabel({
        map: map,
        draggable: false,
        labelContent: l.nome,
           labelAnchor: new google.maps.Point(22, 0),
           labelClass: "label-marker", // the CSS class for the label
           icon: {}

    });
  local_map.setPosition(latlng);
  circle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#000000',
      fillOpacity: 0.35,
      map: map,
      radius: parseInt(l.raio)
    }); 
    circle.bindTo('center', local_map, 'position');
}
$(document).ready(function(){
	initMap();

	

 
});

