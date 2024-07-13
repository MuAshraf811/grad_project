import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:location/location.dart';

class LocationView extends StatefulWidget {
  const LocationView(
      {super.key, this.lat = 31.5, this.long = 30.5, this.title});
  final double? lat;
  final double? long;
  final String? title;
  @override
  State<LocationView> createState() => _LocationView();
}

class _LocationView extends State<LocationView> {
  Location location = Location();
  final Map<String, Marker> _markers = {};
  late final Set<Marker> allMarkers;

  double latitude = 0;
  double longitude = 0;
  GoogleMapController? _controller;
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(26.8206, 30.8025),
    zoom: 10,
  );

  getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currentPosition = await location.getLocation();
    latitude = currentPosition.latitude!;
    longitude = currentPosition.longitude!;

    final marker = Marker(
      markerId: const MarkerId('myLocation'),
      position: LatLng(latitude, longitude),
      infoWindow: const InfoWindow(
        title: 'This is your location',
      ),
    );
    setState(() {
      _markers['myLocation'] = marker;
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(latitude, longitude), zoom: 12),
        ),
      );
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    allMarkers = {
      Marker(
        markerId: const MarkerId("your destination"),
        position: LatLng(widget.lat!, widget.long!),
        onDrag: (value) {},
      ),
      Marker(
        markerId: const MarkerId('Your Current Location'),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: const InfoWindow(
          title: 'This is your location',
        ),
      ),
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.teal,
              ),
              borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(height: 24),
            const CustomAppBar(title: 'Find Our Locations'),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: LatLng(latitude, longitude)),
                    markers: allMarkers,
                    onTap: (LatLng latlng) {
                      latitude = latlng.latitude;
                      longitude = latlng.longitude;
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      await controller
                          .animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                              widget.lat ?? latitude, widget.long ?? longitude),
                          zoom: 13,
                        ),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
