import '../../models/character.dart';

abstract class GetMaleCharactersState {
  final String message;
  List<Character>? characters;

  GetMaleCharactersState(this.message);
}

class GetMaleCharactersInitialState extends GetMaleCharactersState {
  GetMaleCharactersInitialState(String message) : super(message);
}

class GetMaleCharactersLoadState extends GetMaleCharactersState {
  GetMaleCharactersLoadState(String message) : super(message);
}

class GetMaleCharactersSuccessState extends GetMaleCharactersState {
  GetMaleCharactersSuccessState(String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetMaleCharactersNotFoundState extends GetMaleCharactersState {
  GetMaleCharactersNotFoundState(String message) : super(message);
}
