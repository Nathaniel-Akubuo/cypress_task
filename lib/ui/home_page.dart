import 'package:cypress_task/ui/widgets/album_widget.dart';
import 'package:cypress_task/widgets/error_widget.dart';
import 'package:flutter/material.dart';

import '../bloc/album_list_bloc.dart';
import '../models/album.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AlbumsCubit _albumsCubit;

  @override
  void initState() {
    super.initState();
    _albumsCubit = AlbumsCubit();
    _albumsCubit.fetchAlbums();
  }

  @override
  void dispose() {
    _albumsCubit.close();
    super.dispose();
  }

  int _getLoopingIndex(int index, int length) {
    var max = (index / length).floor();
    var loopingIndex = index - (length * max);
    return loopingIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: StreamBuilder<List<Album>?>(
        stream: _albumsCubit.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('No data');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              var data = snapshot.data;

              if (data == null) {
                return const CustomErrorWidget();
              } else {
                return ListView.builder(itemBuilder: (_, index) {
                  var list = snapshot.data ?? [];
                  var album = list[_getLoopingIndex(index, list.length)];
                  return AlbmWidget(album: album);
                });
              }

            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
