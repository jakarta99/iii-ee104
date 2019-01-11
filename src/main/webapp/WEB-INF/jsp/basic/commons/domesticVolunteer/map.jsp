<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	html, body { height: 100%; margin: 0; padding: 0; }
	#map { height: 100%; }
</style>
<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initialize&key=AIzaSyDqcGNbZnfiRTYGnKlM5tFibQpL6g3vw98"></script>
<script type="text/javascript">
var geocoder = null;
var map = null;
function initialize() {
	geocoder = new google.maps.Geocoder();
	var divElement = document.getElementById("map");
	map = new google.maps.Map(divElement, {
		center : {
			lat : 25.033,
			lng : 121.543
		},
		zoom: 17,
		mapTypeId: google.maps.MapTypeId.HYBRID
	});
}
function doClick() {
	var address = document.getElementById("address").value;
	if(geocoder) {
		geocoder.geocode({"address": address}, function(results, status) {
			if(status != google.maps.GeocoderStatus.OK)  {
				alert("Geocoder Failed: " + status);
			} else {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map: map,
					position: results[0].geometry.location
				});
			}
		});
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Google Map JavaScript API Demo</title>
</head>
<body>
<p>
	<input type="text" id="address"/>
	<input type="button" value="Go!" onclick="doClick()" />
</p>
<div id="map"></div>

</body>
</html>
