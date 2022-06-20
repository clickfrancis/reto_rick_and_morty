import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/colors/colors_app.dart';
import 'routes/routes.dart';
import 'welcome_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      Navigator.pushReplacementNamed(context, Routes.welcomePage);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BackgroundImage(
        child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/degradado.png"),
                fit: BoxFit.cover),
          ),
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logomobile.png",
                    width: size.width * 0.7),
                Image.asset("assets/images/rick-and-morty-logo-mobile.png",
                    width: size.width * 0.7),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28.0, top: 40.0),
                  child: Text(
                    'Bienvenido',
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: AppColors.description.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
