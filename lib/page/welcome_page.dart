import 'package:flutter/material.dart';

import '../resources/strings/app_strings.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: BackgroundImage(
      child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/degradado.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset("assets/images/logomobile.png"),
              ),
              Image.asset("assets/images/rick-and-morty-logo-mobile.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  AppStrings.titleWelcome,
                  style: theme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  AppStrings.descriptionWelcome,
                  style: theme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Continuar'),
                ),
              )
            ],
          )),
    ));
  }
}

class BackgroundImage extends StatelessWidget {
  final Widget? child;
  const BackgroundImage({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background_welcome.png"),
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
