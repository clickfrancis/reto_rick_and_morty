import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_female_characters_state.dart';

class GetFemaleCharactersBloc extends Cubit<GetFemaleCharactersState> {
  CharacterService characters = CharacterService();
  GetFemaleCharactersBloc()
      : super(GetFemaleCharactersInitialState(AppStrings.unknown)) {
    getFemaleCharacters();
  }

  Future<void> getFemaleCharacters() async {
    try {
      emit(GetFemaleCharactersLoadState(AppStrings.loading));
      final json = await characters.getFilteredCharacters(
          CharacterFilters(gender: CharacterGender.female));
      emit(GetFemaleCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetFemaleCharactersNotFoundState(AppStrings.unknown));
    }
  }
}
