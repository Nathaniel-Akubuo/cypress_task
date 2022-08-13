import 'package:bloc/bloc.dart';
import 'package:cypress_task/models/album.dart';
import 'package:cypress_task/repositories/json_place_holder_client.dart';

class AlbumsCubit extends Cubit<List<Album>?> {
  final _client = JsonPlaceHolderClient();

  AlbumsCubit() : super(null);

  void fetchAlbums() async {
    List<Album>? albums =
        await _client.getLocalAlbums() ?? await _client.getAlbums();
    emit(albums);
  }
}
