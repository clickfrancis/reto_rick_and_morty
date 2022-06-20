import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_genderless_characters_state.dart';

class GetGenderlessCharactersBloc extends Cubit<GetGenderlessCharactersState> {
  CharacterService characters = CharacterService();
  GetGenderlessCharactersBloc()
      : super(GetGenderlessCharactersInitialState(AppStrings.unknown)) {
    getGenderlessCharacters();
  }

  Future<void> getGenderlessCharacters() async {
    try {
      emit(GetGenderlessCharactersLoadState(AppStrings.loading));
      final json = await characters.getFilteredCharacters(
          CharacterFilters(gender: CharacterGender.unknown));
      emit(GetGenderlessCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetGenderlessCharactersNotFoundState(AppStrings.unknown));
    }
  }
}
