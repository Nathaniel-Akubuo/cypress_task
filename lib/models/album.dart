import 'package:cypress_task/models/photo.dart';

class Album {
  int? id;
  String? title;
  List<Photo>? photos;

  Album({
    this.id,
    this.title,
    this.photos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'photos': photos == null
          ? null
          : List<dynamic>.from(photos!.map((x) => x.toMap())),
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      photos: map['photos'] == null
          ? null
          : List<Photo>.from((map['photos']).map((x) => Photo.fromMap(x))),
    );
  }
}
