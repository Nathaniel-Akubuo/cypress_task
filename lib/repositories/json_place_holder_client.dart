import 'dart:convert';

import 'package:cypress_task/models/album.dart';
import 'package:cypress_task/models/photo.dart';
import 'package:cypress_task/services/dio_service.dart';
import 'package:cypress_task/services/local_storage_services.dart';
import 'package:cypress_task/utilities/api_util.dart';
import 'package:cypress_task/utilities/app_strings.dart';
import 'package:cypress_task/utilities/logger_service.dart';

class JsonPlaceHolderClient {
  final _dioService = DioService();
  SharedPreferenceLocalStorage? _localStorage;
  final _logger = LoggerService('JsonPlaceHolderClient');

  Future<void> _setInstance() async {
    _localStorage = await SharedPreferenceLocalStorage.getInstance();
  }

  Future<List<Album>?> getAlbums() async {
    List<Album> albums = [];
    try {
      var response = await _dioService.get('albums');

      var validated = ApiUtils.validated(response);
      if (validated) {
        for (var map in response.data) {
          albums.add(Album.fromMap(map));
        }

        for (var album in albums) {
          album.photos = await _getPhotos(album);
        }

        await _saveAlbumLocally(albums);

        return albums;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Album>?> getLocalAlbums() async {
    try {
      if (_localStorage == null) {
        await _setInstance();
      }

      var rawList = _localStorage?.getStringList(AppStrings.savedAlbums);

      if (rawList == null) {
        return null;
      } else {
        List<Album> albums = [];

        for (var source in rawList) {
          albums.add(Album.fromMap(jsonDecode(source)));
        }
        return albums;
      }
    } catch (e) {
      _logger.log(e);
      return null;
    }
  }

  Future<List<Photo>?> _getPhotos(Album album) async {
    try {
      List<Photo> photos = [];
      var response = await _dioService.get('albums/${album.id}/photos');
      var validated = ApiUtils.validated(response);
      if (validated) {
        for (var map in response.data) {
          var photo = Photo.fromMap(map);
          photos.add(photo);
        }
        return photos;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> _saveAlbumLocally(List<Album> list) async {
    try {
      List<String> rawList = [];

      for (var album in list) {
        rawList.add(jsonEncode(album.toMap()));
      }

      if (_localStorage == null) {
        await _setInstance();
      }

      await _localStorage?.setStringList(AppStrings.savedAlbums, rawList);
    } catch (e) {
      _logger.log(e);
    }
  }
}
