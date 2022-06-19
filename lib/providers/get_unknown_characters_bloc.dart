import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_unknown_characters_state.dart';

class GetUnknownCharactersBloc extends Cubit<GetUnknownCharactersState> {
  CharacterService characters = CharacterService();
  GetUnknownCharactersBloc()
      : super(GetUnknownCharactersInitialState(AppStrings.unknown)) {
    getUnknownCharacters();
  }

  Future<void> getUnknownCharacters() async {
    try {
      emit(GetUnknownCharactersLoadState(AppStrings.loading));
      final json = await characters.getFilteredCharacters(
          CharacterFilters(gender: CharacterGender.genderless));
      emit(GetUnknownCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetUnknownCharactersNotFoundState(AppStrings.unknown));
    }
  }
}
