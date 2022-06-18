import 'package:dio/dio.dart';
import '../../../models/info.dart';

abstract class GetEntitiesService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);
        try {
          var dataInfo = response.data["info"];
          Info info = Info.fromJson(response.data["info"]);
          nextUrl = info.next;
          allEntities.addAll(
              List<Map<String, dynamic>>.from(response.data["results"]));
        } catch (e) {
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }

      return allEntities;
    } on DioError {
      rethrow;
    }
  }
}
