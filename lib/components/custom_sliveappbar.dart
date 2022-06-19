import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';
import '../resources/strings/app_strings.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      expandedHeight: size.height * 0.3,
      floating: true,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.05),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/appbarmobile.png"),
                  fit: BoxFit.fill),
            ),
            child: Container(
              color: AppColors.backgroundOpacity.withOpacity(0.7),
              child: Image.asset(
                "assets/images/rick-and-morty-logo-mobile.png",
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(size.width, size.height * 0.13),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.appBar,
          ),
          height: size.height * 0.13,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: AppStrings.hintText,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.textField,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.buttonMenu,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
