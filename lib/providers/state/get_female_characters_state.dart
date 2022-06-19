import '../../models/character.dart';

abstract class GetFemaleCharactersState {
  final String message;
  List<Character>? characters;

  GetFemaleCharactersState(this.message);
}

class GetFemaleCharactersInitialState extends GetFemaleCharactersState {
  GetFemaleCharactersInitialState(String message) : super(message);
}

class GetFemaleCharactersLoadState extends GetFemaleCharactersState {
  GetFemaleCharactersLoadState(String message) : super(message);
}

class GetFemaleCharactersSuccessState extends GetFemaleCharactersState {
  GetFemaleCharactersSuccessState(String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetFemaleCharactersNotFoundState extends GetFemaleCharactersState {
  GetFemaleCharactersNotFoundState(String message) : super(message);
}
