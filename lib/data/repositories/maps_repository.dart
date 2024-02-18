import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorant_wiki/data/models/map_model.dart';
import 'package:valorant_wiki/data/providers/api.dart';

class MapsRepository {
  Future<List<MapModel>> getMaps() async {
    const String endpoint = "maps";
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => MapModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
