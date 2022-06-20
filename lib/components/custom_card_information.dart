import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';

class CustomCardInformation extends StatelessWidget {
  const CustomCardInformation({
    Key? key,
    this.info,
    this.name,
  }) : super(key: key);
  final String? info;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      width: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.borderCard),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 5.0,
                        ),
                        child: Icon(Icons.info, size: 20),
                      ),
                      Text(
                        info!,
                        style: theme.headline2!
                            .copyWith(color: AppColors.textBlack),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    name!,
                    style:
                        theme.headline6!.copyWith(color: AppColors.textBlack),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
