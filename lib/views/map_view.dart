import 'package:flutter/material.dart';
import 'package:location_service/datamodels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';
import 'dart:math' show cos, sqrt, asin;
// import 'package:geolocator/geolocator.dart';

int calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return (12742 * asin(sqrt(a)) + 50).round();
}

class MapView extends StatefulWidget {
  const MapView({Key key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    var lat = userLocation.latitude;
    var lng = userLocation.longitude;

    var dis1 = calculateDistance(lat, lng, 19.899419, 75.318652);
    var dis2 = calculateDistance(lat, lng, 20.019061,75.179313);
    var dis3 = calculateDistance(lat, lng, 20.534033, 75.748283);
    var dis4 = calculateDistance(lat, lng, 20.080996,75.186065);
    
    return Scaffold(
      // Center(
      //   child: Text(
      //       'Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
      // ),

      appBar: AppBar(
        title: Text('Aurangabad Tour Guider'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      body: new FlutterMap(
        options: new MapOptions(
          center: LatLng(19.895900, 75.318820),
          zoom: 6.5,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiY2FzY29kZXJzIiwiYSI6ImNrMWVqdHI3ZjBpY3gzbHBkYjZpOWtwaXgifQ.7r7cBoyyYTa5wVYYKlGiPg',
              'id': 'mapbox.streets',
            },
          ),
          new MarkerLayerOptions(
            markers: [


              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(lat, lng),
                builder: (ctx) => new Container(
                  child: new IconButton(
                    // icon: Icon(FontAwesomeIcons.mapMarker),
                    icon: new Icon(FontAwesomeIcons.mapMarkerAlt),
                    color: Colors.green[900],
                    iconSize: 35,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                           color: Colors.white,
                                // child: new Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Hello User',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .apply(fontSizeFactor: 1)),
                                            Text(
                                        '\n'),
                                    Text(
                                        'Live User Location',textScaleFactor: 1.5,),
                                  ],
                                )
                                );
                          });
                    },
                  ),
                ),
              ),

              
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(19.899419, 75.318652),
                builder: (ctx) => new Container(
                  child: new IconButton(
                    // icon: Icon(FontAwesomeIcons.mapMarker),
                    icon: new Icon(FontAwesomeIcons.mapMarkerAlt),
                    color: Colors.red[900],
                    iconSize: 35,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                                color: Colors.white,
                                // child: new Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Bibi qa Maqbara',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .apply(fontSizeFactor: 1)),
                                            Text(
                                        '\n'),
                                    Text(
                                        'Distance from your location is : $dis1 km.',textScaleFactor: 1.5,),
                                  
                                  ],
                                )
                                // )
                                );
                          });
                    },
                  ),
                ),
              ),



               new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(20.019061,75.179313),
                builder: (ctx) => new Container(
                  child: new IconButton(
                    // icon: Icon(FontAwesomeIcons.mapMarker),
                    icon: new Icon(FontAwesomeIcons.mapMarkerAlt),
                    color: Colors.red[900],
                    iconSize: 35,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                                color: Colors.white,
                                // child: new Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Ellora Caves',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .apply(fontSizeFactor: 1)),
                                            Text(
                                        '\n'),
                                    Text(
                                        'Distance from your location is : $dis2 km.',textScaleFactor: 1.5,),
                                  
                                  ],
                                )
                                // )
                                );
                          });
                    },
                  ),
                ),
              ),
              
               new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(20.534033, 75.748283),
                builder: (ctx) => new Container(
                  child: new IconButton(
                    // icon: Icon(FontAwesomeIcons.mapMarker),
                    icon: new Icon(FontAwesomeIcons.mapMarkerAlt),
                    color: Colors.red[900],
                    iconSize: 35,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                                color: Colors.white,
                                // child: new Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Ajanta Caves',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .apply(fontSizeFactor: 1)),
                                            Text(
                                        '\n'),
                                    Text(
                                        'Distance from your location is : $dis3 km.',textScaleFactor: 1.5,),
                                  
                                  ],
                                )
                                // )
                                );
                          });
                    },
                  ),
                ),
              ),

              
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(20.080996,75.186065),
                builder: (ctx) => new Container(
                  child: new IconButton(
                    // icon: Icon(FontAwesomeIcons.mapMarker),
                    icon: new Icon(FontAwesomeIcons.mapMarkerAlt),
                    color: Colors.red[900],
                    iconSize: 35,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                                color: Colors.white,
                                // child: new Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Mhaismal Hill-Station',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .apply(fontSizeFactor: 1)),
                                            Text(
                                        '\n'),
                                    Text(
                                        'Distance from your location is : $dis4 km.',textScaleFactor: 1.5,),
                                  
                                  ],
                                )
                                // )
                                );
                          });
                    },
                  ),
                ),
              ),
            
            
            ],
          ),
        ],
      ),
    );
  }
}
