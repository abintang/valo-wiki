import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorant_wiki/data/models/gun_buddies_model.dart';
import 'package:valorant_wiki/data/providers/api.dart';

class GunBuddiesRepository {
  String endpoint = "buddies";
  Future<List<GunBuddiesModel>> getBuddies() async {
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => GunBuddiesModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to Load Gun Buddies");
    }
  }
}
