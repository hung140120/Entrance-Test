import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  late final MapBloc bloc = GetIt.instance.get<MapBloc>();
  GoogleMapController? _controller;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.080414, 108.220094),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    bloc.add(const InitMapLocation());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
          child: BlocProvider<MapBloc>(
        lazy: false,
        create: (context) => bloc,
        child: BlocListener<MapBloc, MapState>(
          listenWhen: (previous, current) =>
              previous.userLocations != current.userLocations,
          listener: (BuildContext context, state) async {
            if (state.userLocations.isNotEmpty) {
              final zoom = await _controller?.getZoomLevel() ?? 14.0;
              _controller?.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(state.userLocations.last.latitude,
                        state.userLocations.last.longitude),
                    zoom: zoom,
                  ),
                ),
              );
            }
          },
          child: Container(
              color: Colors.white24,
              alignment: Alignment.topLeft,
              child: _buildMap()),
        ),
      )),
    );
  }

  Widget _buildMap() {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) =>
          previous.userLocations != current.userLocations,
      builder: (context, state) {
        final userLocations = state.userLocations;
        return userLocations.isEmpty
            ? const Center(
                child: Text(
                'NO DATA',
                style: TextStyle(fontSize: 30),
              ))
            : GoogleMap(
                initialCameraPosition: _kGooglePlex,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                // ignore: prefer_collection_literals
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer())),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                circles: state.userLocations.map((e) {
                  return Circle(
                    circleId: CircleId(e.id.toString()),
                    radius: 70,
                    fillColor: Colors.blue,
                    strokeWidth: 2,
                    strokeColor: Colors.red,
                    center: LatLng(e.latitude, e.longitude),
                  );
                }).toSet(),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
