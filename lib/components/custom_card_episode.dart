import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';

class CustomCardEpisode extends StatelessWidget {
  const CustomCardEpisode({
    Key? key,
    required this.name,
    required this.episode,
    required this.airDate,
  }) : super(key: key);
  final String name;
  final String episode;
  final String airDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: AppColors.borderCard)),
      elevation: 0,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(children: [
        Column(
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              episode,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              airDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ]),
    );
  }
}
