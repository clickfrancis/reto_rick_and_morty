import '../../rick_and_morty_api.dart';
import '../entities/get_entities.dart';

class EpisodeService extends GetEntitiesService {
  Future<List<Episode>> getAllEpisodes() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.episodeEndpoint}');
    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }

  Future<List<Episode>> getListOfEpisodes(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.episodeEndpoint}/$ids');
    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }

  Future<List<Episode>> getFilteredEpisodes(EpisodeFilters filters) async {
    var prefs = '?name=${filters.name}&episode=${filters.episode}';
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.episodeEndpoint}$prefs');
    return List<Episode>.from(objects.map((x) => Episode.fromJson(x)));
  }
}
