import 'package:cypress_task/models/album.dart';
import 'package:flutter/material.dart';

import '../../utilities/ui_helpers.dart';
import '../../widgets/image_card.dart';

class AlbmWidget extends StatelessWidget {
  final Album album;
  const AlbmWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kMainPadding,
            child: Text(
              album.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ImageCard(imageURL: album.photos?[index].url ?? ''),
              ),
              itemCount: album.photos?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
