import '../../models/character.dart';

abstract class GetGenderlessCharactersState {
  final String message;
  List<Character>? characters;

  GetGenderlessCharactersState(this.message);
}

class GetGenderlessCharactersInitialState extends GetGenderlessCharactersState {
  GetGenderlessCharactersInitialState(String message) : super(message);
}

class GetGenderlessCharactersLoadState extends GetGenderlessCharactersState {
  GetGenderlessCharactersLoadState(String message) : super(message);
}

class GetGenderlessCharactersSuccessState extends GetGenderlessCharactersState {
  GetGenderlessCharactersSuccessState(
      String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetGenderlessCharactersNotFoundState
    extends GetGenderlessCharactersState {
  GetGenderlessCharactersNotFoundState(String message) : super(message);
}
