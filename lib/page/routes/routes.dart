import 'package:rick_and_morty_app/page/home_page.dart';

import '../chacaracter_page.dart';

abstract class Routes {
  static const String home = "/home";
  static const String characterPage = "/";

  static final routes = {
    home: (context) => const HomePage(),
    characterPage: (context) => const CharacterPage(),
  };
}
