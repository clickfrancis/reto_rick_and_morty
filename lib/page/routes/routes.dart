import 'package:rick_and_morty_app/page/home_page.dart';

import '../splash.dart';
import '../welcome_page.dart';

abstract class Routes {
  static const String splash = "/";
  static const String welcomePage = "/welcomePage";
  static const String home = "/home";
  static const String characterPage = "/characterPage";

  static final routes = {
    splash: (context) => const Splash(),
    welcomePage: (context) => const WelcomePage(),
    home: (context) => const HomePage(),
  };
}
