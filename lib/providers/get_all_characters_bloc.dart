import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/rick_and_morty_api.dart';
import '../resources/strings/app_strings.dart';
import 'state/get_all_characters_state.dart';

class GetAllCharactersBloc extends Cubit<GetAllCharactersState> {
  CharacterService characters = CharacterService();
  GetAllCharactersBloc()
      : super(GetAllCharactersInitialState(AppStrings.unknown)) {
    getAllCharacters();
  }

  Future<void> getAllCharacters() async {
    try {
      emit(GetAllCharactersLoadState(AppStrings.loading));
      final json = await characters.getAllCharacters();
      emit(GetAllCharactersSuccessState(AppStrings.success, json));
    } catch (e) {
      emit(GetAllCharactersInitialState(AppStrings.unknown));
    }
  }
}
