import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background-footer.png"),
              fit: BoxFit.fill),
        ),
        child: Container(
          color: AppColors.backgroundOpacity.withOpacity(0.5),
          child: Image.asset(
            "assets/images/logomobile.png",
          ),
        ),
      ),
    );
  }
}
