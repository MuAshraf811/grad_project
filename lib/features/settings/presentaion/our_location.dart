// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:location/location.dart';

class LocationHandlerView extends StatefulWidget {
  const LocationHandlerView({
    super.key,
    this.latitude,
    this.longitude,
  });
  final double? latitude;
  final double? longitude;
  @override
  State<LocationHandlerView> createState() => _LocationHandlerViewState();
}

class _LocationHandlerViewState extends State<LocationHandlerView> {
  late GoogleMapController _mapController;
  double? _latitude;
  double? _longitude;
  _handlePermission() async {
    final location = Location.instance;
    final isServiceEnabled = await location.serviceEnabled();
    !isServiceEnabled ? await location.requestService() : null;
    if (await location.hasPermission() == PermissionStatus.granted) {
      final userLocation = await location.getLocation();
      _latitude = userLocation.latitude;
      _longitude = userLocation.longitude;
    } else if (await location.hasPermission() == PermissionStatus.denied) {
      await location.requestPermission();
    } else if (await location.hasPermission() ==
        PermissionStatus.deniedForever) {
      await location.requestPermission();
    }
  }

  late Set<Marker> _markers;

  @override
  void initState() {
    _handlePermission();
    _markers = {
      Marker(
        markerId: const MarkerId('User Current Location'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(_latitude!, _longitude!),
        visible: true,
      ),
      Marker(
        markerId: const MarkerId('Needed Location '),
        icon: BitmapDescriptor.defaultMarker,
        position:
            LatLng(widget.latitude ?? 31.5757, widget.longitude ?? 30.5353),
        visible: true,
      ),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 6.w, right: 6.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 36),
              const CustomAppBar(title: 'OUR LOCATIONS'),
              GoogleMap(
                markers: _markers,
                onMapCreated: (controller) {
                  _mapController = controller;

                  if (widget.latitude != null && widget.longitude != null) {
                    _mapController.animateCamera(CameraUpdate.newLatLng(
                        LatLng(widget.latitude!, widget.longitude!)));
                  } else {
                    _mapController.animateCamera(CameraUpdate.newLatLng(
                        LatLng(_latitude!, _longitude!)));
                  }
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(_latitude!, _longitude!),
                  zoom: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
