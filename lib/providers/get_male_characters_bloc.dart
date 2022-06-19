import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_male_characters_state.dart';

class GetMaleCharactersBloc extends Cubit<GetMaleCharactersState> {
  CharacterService characters = CharacterService();
  GetMaleCharactersBloc()
      : super(GetMaleCharactersInitialState(AppStrings.unknown)) {
    getMaleCharacters();
  }

  Future<void> getMaleCharacters() async {
    try {
      emit(GetMaleCharactersLoadState(AppStrings.loading));
      final json = await characters.getFilteredCharacters(
          CharacterFilters(gender: CharacterGender.male));
      emit(GetMaleCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetMaleCharactersNotFoundState(AppStrings.unknown));
    }
  }
}
