// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require markerwithlabel

//= require_self

var geocoder;
var map;
var marker;
function initMap() {

 var latlng = new google.maps.LatLng(locais[0].latitude ,  locais[0].longitude );
    var options = {
        zoom: 5,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
 
    map = new google.maps.Map(document.getElementById("mapa-cad-local-de-trabalho"), options);
 
    geocoder = new google.maps.Geocoder();
 

     if(locais.length == 1 )  {
        plotLocalDeTrabalho(locais[0], true);

     }else{
        for(i = 0; i< locais.length; i++){
        plotLocalDeTrabalho(locais[0],false );
    } 
}

    google.maps.event.addListener(marker, 'drag', function () {
      geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) { 
                $('#endereco').val(results[0].formatted_address);
                $('#local_de_trabalho_latitude').val(marker.getPosition().lat());
                $('#local_de_trabalho_longitude').val(marker.getPosition().lng());
            }
        }
      });
    });

}




function plotLocalDeTrabalho(l,drag){
     var local_map;
    var latlng = new google.maps.LatLng(l.latitude, l.longitude);
    local_map= new MarkerWithLabel({
        map: map,
        draggable: drag,
        labelContent: l.nome,
           labelAnchor: new google.maps.Point(22, 0),
           labelClass: "label-marker", // the CSS class for the label
           icon: {}

    });
    if(drag == true){
      marker = local_map;
    }
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
        map.setCenter(local_map);
    map.setZoom(16);
}



$(document).ready(function(){
	initMap();
	 function carregarNoMapa(endereco) {
        geocoder.geocode({ 'address': endereco + ', Brasil', 'region': 'BR' }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
 
                    $('#endereco').val(results[0].formatted_address);
                    $('#local_de_trabalho_latitude').val(latitude);
                    $('#local_de_trabalho_longitude').val(longitude);
 
                    var location = new google.maps.LatLng(latitude, longitude);
                    marker.setPosition(location);
                    map.setCenter(location);
                    map.setZoom(16);
                }
            }
        });
    }
	
	 $("#mostrar-no-mapa").click(function() {
        if($(this).val() != "")
            carregarNoMapa($("#endereco").val());
    });
 
    $("#endereco").blur(function() {
        if($(this).val() != "")
            carregarNoMapa($(this).val());
    });
	

     $("#endereco").autocomplete({
        source: function (request, response) {
            geocoder.geocode({ 'address': request.term + ', Brasil', 'region': 'BR' }, function (results, status) {
                response($.map(results, function (item) {
                    return {
                        label: item.formatted_address,
                        value: item.formatted_address,
                        latitude: item.geometry.location.lat(),
                        longitude: item.geometry.location.lng()
                    }
                }));
            })
        },
        select: function (event, ui) {
            $("#local_de_trabalho_latitude").val(ui.item.latitude);
            $("#local_de_trabalho_longitude").val(ui.item.longitude);
            var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
            marker.setPosition(location);
            map.setCenter(location);
            map.setZoom(16);
        }
    });

	var circle;
  if(circle != null){circle.setMap(null);}
     circle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      radius: parseInt($("#local_de_trabalho_raio").val())
    }); 
    circle.bindTo('center', marker, 'position');
    
	$("#local_de_trabalho_raio").on('input',function(){
		if(circle != null){circle.setMap(null);}
	   circle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      radius: parseInt($("#local_de_trabalho_raio").val())
    }); 
		circle.bindTo('center', marker, 'position');
		
	});

});

