import '../../models/character.dart';

abstract class GetFavoriteCharactersState {
  final String message;
  List<Character>? characters;

  GetFavoriteCharactersState(this.message);
}

class GetFavoriteCharactersInitialState extends GetFavoriteCharactersState {
  GetFavoriteCharactersInitialState(String message) : super(message);
}

class GetFavoriteCharactersLoadState extends GetFavoriteCharactersState {
  GetFavoriteCharactersLoadState(String message) : super(message);
}

class GetFavoriteCharactersSuccessState extends GetFavoriteCharactersState {
  GetFavoriteCharactersSuccessState(String message, List<Character> characters)
      : super(message) {
    super.characters = characters;
  }
}

class GetFavoriteCharactersNotFoundState extends GetFavoriteCharactersState {
  GetFavoriteCharactersNotFoundState(String message) : super(message);
}
