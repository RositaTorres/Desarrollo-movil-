import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  var site;

  MapPage(this.site);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.site['Nombre'],
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.site['latitud'], widget.site['longitud']),
            zoom: 15,
          ),
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _showMarkers();
          }),
    );
  }

  _showMarkers() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(widget.site.id),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(widget.site['latitud'], widget.site['longitud'])));
    });
  }
}
