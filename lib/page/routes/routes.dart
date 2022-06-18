import 'package:rick_and_morty_app/page/home_page.dart';

abstract class Routes {
  static const String home = "/";

  static final routes = {
    home: (context) => const HomePage(),
  };
}
