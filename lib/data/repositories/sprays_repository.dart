import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:valorant_wiki/data/models/spray_model.dart';
import 'package:valorant_wiki/data/providers/api.dart';

class SpraysRepository {
  String endpoint = "sprays";
  Future<List<SprayModel>> getSprays() async {
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => SprayModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to Load Sprays");
    }
  }
}
