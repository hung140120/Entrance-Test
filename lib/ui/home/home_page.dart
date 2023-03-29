import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../exception/location_exception.dart';
import '../../helpers/location_helper.dart';
import '../list_location/list_page.dart';
import '../map/map_page.dart';
import 'bloc/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeBloc bloc = GetIt.instance.get<HomeBloc>();

  late final _tabs = [
    'Map view',
    'List view',
  ];

  late final _tabController = TabController(
    vsync: this,
    length: _tabs.length,
  );

  late final LocationHelper location = GetIt.instance.get<LocationHelper>();

  @override
  void initState() {
    super.initState();
    bloc.add(InitTrackingLocation(trackingLocationError: (e) {
      handleException(e);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking User Location'),
      ),
      body: SafeArea(
          child: BlocProvider<HomeBloc>(
        lazy: false,
        create: (context) => bloc,
        child: Container(
            color: Colors.white24,
            alignment: Alignment.topLeft,
            child: _buildTab()),
      )),
    );
  }

  Widget _buildTab() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabView()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      height: 50,
      child: TabBar(
        controller: _tabController,
        tabs: _tabs.map((tabName) {
          return Tab(text: tabName);
        }).toList(),
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        labelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black54),
      ),
    );
  }

  Widget _buildTabView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: _tabs
          .asMap()
          .map((index, _) {
            return MapEntry(
                index, index == 0 ? const MapPage() : const ListPage());
          })
          .values
          .toList(),
    );
  }

  Future<void> handleException(Object? e) async {
    if (e is LocationException) {
      var buttonText = 'OK';
      var message = '';
      VoidCallback? action;
      switch (e.kind) {
        case LocationExceptionKind.locationPermissionDenied:
          message = 'Please grant location permission';
          buttonText = 'OK';
          action = () async {
            await location.requestPermissionLocation();
          };
          break;
        case LocationExceptionKind.locationPermissionDeniedForever:
          message = 'Please grant location permission';
          buttonText = 'Go to settings';
          action = () async {
            await location.openAppSettings();
          };
          break;
        case LocationExceptionKind.gpsNotEnabled:
          message = 'Please enable GPS';
          buttonText = 'Go to settings';
          action = () async {
            await location.openLocationSettings();
          };
          break;
      }
      await showAppDialog('LocationException', message, buttonText, action);
    } else {
      await showAppDialog('UnknownException', e.toString());
    }
  }

  Future<void> showAppDialog(String title, String message,
      [String buttonText = 'OK', VoidCallback? action]) async {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    action?.call();
                  },
                  child: Text(buttonText))
            ],
          );
        });
  }
}
