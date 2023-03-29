import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/list.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with AutomaticKeepAliveClientMixin {
  late final ListBloc bloc = GetIt.instance.get<ListBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(const InitListLocation());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      body: SafeArea(
          child: BlocProvider<ListBloc>(
        lazy: false,
        create: (context) => bloc,
        child: Container(
            color: Colors.white24,
            alignment: Alignment.topLeft,
            child: _buildList()),
      )),
    );
  }

  Widget _buildList() {
    return BlocBuilder<ListBloc, ListState>(
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
            : ListView.builder(
                itemCount: state.userLocations.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('latitude: ${state.userLocations[index].latitude}'),
                      const SizedBox(height: 5,),
                      Text('longitude: ${state.userLocations[index].longitude}'),
                      const Divider(color: Colors.black,)
                    ],
                  );
                },
              );
      },
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
