import '../../models/character.dart';

abstract class GetAllCharactersState {
  final String message;
  List<Character>? characters;

  GetAllCharactersState(this.message);
}

class GetAllCharactersInitialState extends GetAllCharactersState {
  GetAllCharactersInitialState(String message) : super(message);
}

class GetAllCharactersLoadState extends GetAllCharactersState {
  GetAllCharactersLoadState(String message) : super(message);
}

class GetAllCharactersSuccessState extends GetAllCharactersState {
  GetAllCharactersSuccessState(String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetAllCharactersNotFoundState extends GetAllCharactersState {
  GetAllCharactersNotFoundState(String message) : super(message);
}
