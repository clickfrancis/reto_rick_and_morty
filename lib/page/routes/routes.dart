import 'package:rick_and_morty_app/page/home_page.dart';

import '../wellcome_page.dart';

abstract class Routes {
  static const String welcomePage = "/";
  static const String home = "/home";
  static const String characterPage = "/characterPage";

  static final routes = {
    welcomePage: (context) => const WelcomePage(),
    home: (context) => const HomePage(),
  };
}
