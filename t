<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>OpenLayers Map Example</title>
  <link rel="stylesheet" href="dissmap/ol.css" type="text/css">
  <script src="dissmap/dist//ol.js"></script>
  <style>
    .map {
      height: 900px;
      width: 100%;
    }
    .popup {
        background-color: white;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.5);
      }
    
    </style>
  </head>
  <body>
    <div id="map" class="map"></div>
    <div id="popup" class="ol-popup">
      <a href="#" id="popup-closer" class="ol-popup-closer"></a>
      <div id="popup-content"></div>
    </div>

    <script>
      // Create the map
      var map = new ol.Map({
        target: 'map',
        layers: [
          new ol.layer.Tile({
            source: new ol.source.XYZ({
              url: 'https://stamen-tiles.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}.png',
              crossOrigin: 'anonymous'
            })
          })
        ],
        view: new ol.View({
          center: ol.proj.fromLonLat([0, 0]),
          zoom: 2
        })
      });

      // Define a new style for the marker
      var iconStyle = new ol.style.Style({
        image: new ol.style.Icon({
          anchor: [0.5, 1],
          src: 'https://cdn.mapmarker.io/api/v1/pin?size=50&background=%23D32F2F&text=%20'
        })
      });

      // Create the marker
      var marker = new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.fromLonLat([0, 0]))
      });

      // Set the marker style
      marker.setStyle(iconStyle);

      // Create the vector layer
      var vectorLayer = new ol.layer.Vector({
        source: new ol.source.Vector({
          features: [marker]
        })
      });

      map.addLayer(vectorLayer);

      // Create the popup
      var popup = new ol.Overlay({
        element: document.createElement('div'),
        autoPan: true,
        autoPanAnimation: {
          duration: 250
        }
      });

      map.addOverlay(popup);

      // Add a click event to the marker
      map.on('click', function(evt) {
        var feature = map.forEachFeatureAtPixel(evt.pixel, function(feature) {
          return feature;
        });

        if (feature === marker) {
          var coordinate = feature.getGeometry().getCoordinates();
          popup.setPosition(coordinate);
          popup.getElement().innerHTML = '<div class="popup">This is the marker.</div>';
        } else {
          popup.setPosition(undefined);
        }
      });

        // Create a vector layer with country polygons
        var vectorLayer = new ol.layer.Vector({
          source: new ol.source.Vector({
            url: 'https://openlayers.org/en/v3.20.1/examples/data/geojson/countries.geojson',
            format: new ol.format.GeoJSON()
          }),
          style: new ol.style.Style({
            stroke: new ol.style.Stroke({
              color: 'black',
              width: 1
            }),
            fill: new ol.style.Fill({
              color: [255, 255, 255, 0.6]
            })
          })
        });

        // Add the vector layer to the map
        map.addLayer(vectorLayer);

        // Create the overlay
        var overlay = new ol.Overlay({
          element: document.getElementById('popup'),
          autoPan: true,
          autoPanAnimation: {
            duration: 250
          }
        });

        // Add the overlay to the map
        map.addOverlay(overlay);

       // Create a vector layer with country polygons
       var vectorLayer = new ol.layer.Vector({
          source: new ol.source.Vector({
            url: 'https://openlayers.org/en/v3.20.1/examples/data/geojson/countries.geojson',
            format: new ol.format.GeoJSON()
          }),
          //style: new ol.style.Style({
            //stroke: new ol.style.Stroke({
              //color: 'black',
              //width: 1
            //}),
            //fill: new ol.style.Fill({
              //color: [255, 255, 255, 0.6]
            //})
          })
        //});

        // Add the vector layer to the map
        map.addLayer(vectorLayer);

        // Create the overlay
        var overlay = new ol.Overlay({
          element: document.getElementById('popup'),
          autoPan: true,
          autoPanAnimation: {
            duration: 250
          }
        });

        // Add the overlay to the map
        map.addOverlay(overlay);

        // Add a click event listener to the vector layer
        map.on('click', function(event) {
          map.forEachFeatureAtPixel(event.pixel, function(feature) {
            // Do something with the clicked feature (country)
            var countryName = feature.get('name');
            var coordinate = event.coordinate;
            var element = overlay.getElement();
            element.innerHTML = '<div>' + countryName + '</div>';
            overlay.setPosition(coordinate);
          });
        });
                // Create the popup
        var popup = new ol.Overlay({
          element: document.createElement('div'),
          autoPan: true,
          autoPanAnimation: {
            duration: 250
          }
        });

        // Add content and styling to the popup element
        var popupContent = document.createElement('div');
        popupContent.className = 'popup';
        popupContent.innerHTML = '<h3>Country Name</h3><p>Population: 123456</p>';
        popup.setElement(popupContent);

        map.addOverlay(popup);

        // Add a click event listener to the vector layer
        map.on('click', function(event) {
          map.forEachFeatureAtPixel(event.pixel, function(feature) {
            // Get information about the clicked feature (country)
            var countryName = feature.get('name');
            var population = feature.get('pop_est');

            // Update the content of the popup element with information about the clicked feature
            popupContent.innerHTML = '<h3>' + countryName + '</h3><p>Population: ' + population + '</p>';

            // Position and display the popup
            var coordinate = event.coordinate;
            popup.setPosition(coordinate);
          });
        });

    </script>
  </body>
</html>
