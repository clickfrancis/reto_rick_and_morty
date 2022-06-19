import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';
import '../resources/strings/app_strings.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.status,
    required this.name,
    required this.location,
    required this.origin,
  }) : super(key: key);
  final String image;
  final String status;
  final String name;
  final String location;
  final String origin;

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
        Row(
          children: [
            Image.network(
              image,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 5.0,
                          ),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.aliveCircle,
                            ),
                          ),
                        ),
                        Text(
                          status,
                        ),
                      ],
                    ),
                    Text(name),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(AppStrings.location),
                    ),
                    Text(
                      location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(AppStrings.origin),
                    ),
                    Text(
                      origin,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
