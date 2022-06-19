import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';
import '../resources/strings/app_strings.dart';

class Favorites extends StatelessWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Row(
        children: [
          const Text(AppStrings.showFavorites),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.favoriteCircle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/favorite-off.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
