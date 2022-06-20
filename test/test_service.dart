import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rick_and_morty_app/core/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/providers/get_all_characters_bloc.dart';
import 'package:rick_and_morty_app/providers/state/get_all_characters_state.dart';

void main() async {
  Dio? dio;
  DioAdapter? dioAdapter;
  CharacterService? caracterService;
  String path = Constants.baseURL + Constants.characterEndpoint;
  GetAllCharactersBloc? getAllCharactersBloc;

  group('Testes Sign In  user', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio!);
      caracterService = CharacterService();
      getAllCharactersBloc = GetAllCharactersBloc();
    });

    test('Test Authenticated successfully', () async {
      expect(GetAllCharactersBloc().state, isA<GetAllCharactersInitialState>());
      dioAdapter!.onPost(
        path,
        (server) => server.reply(200, {}),
      );
      await getAllCharactersBloc!.getAllCharacters();
      expect(getAllCharactersBloc!.state, isA<GetAllCharactersSuccessState>());
    });
  });
}
