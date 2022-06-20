import '../../models/character.dart';

abstract class GetUnknownCharactersState {
  final String message;
  List<Character>? characters;

  GetUnknownCharactersState(this.message);
}

class GetUnknownCharactersInitialState extends GetUnknownCharactersState {
  GetUnknownCharactersInitialState(String message) : super(message);
}

class GetUnknownCharactersLoadState extends GetUnknownCharactersState {
  GetUnknownCharactersLoadState(String message) : super(message);
}

class GetUnknownCharactersSuccessState extends GetUnknownCharactersState {
  GetUnknownCharactersSuccessState(String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetUnknownCharactersNotFoundState extends GetUnknownCharactersState {
  GetUnknownCharactersNotFoundState(String message) : super(message);
}
