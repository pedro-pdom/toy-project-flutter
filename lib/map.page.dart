import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  double lat = -7.9456247;
  double long = -34.8613687;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(onSubmitted: (val) {
          lat = -7.9456247;
          long = -34.8613687;

          LatLng position = LatLng(lat, long);
          mapController.moveCamera(CameraUpdate.newLatLng(position));

          final Marker marker = Marker(
            markerId: new MarkerId("123456"),
            position: position,
            infoWindow: InfoWindow(
                title: "IFPE - Campus Paulista",
                snippet: 'Maranguape I, Paulista - PE, 53441-601'),
          );
          setState(() {
            markers.add(marker);
          });
        }),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 11.0,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
