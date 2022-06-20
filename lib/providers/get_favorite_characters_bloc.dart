import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_favorite_characters_state.dart';

class GetFavoriteCharactersBloc extends Cubit<GetFavoriteCharactersState> {
  CharacterService characters = CharacterService();
  GetFavoriteCharactersBloc()
      : super(GetFavoriteCharactersInitialState(AppStrings.unknown)) {
    getFavoriteCharacters();
  }

  Future<void> getFavoriteCharacters() async {
    try {
      emit(GetFavoriteCharactersLoadState(AppStrings.loading));
      final json = await characters.getListOfCharacters([2, 3]);
      emit(GetFavoriteCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetFavoriteCharactersNotFoundState(AppStrings.unknown));
    }
  }
}
