import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorant_wiki/data/models/weapon_model.dart';
import 'package:valorant_wiki/data/providers/api.dart';

class WeaponsRepository {
  String endpoint = "weapons";
  Future<List<WeaponsModel>> getWeapons(int startIndex, int count) async {
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      final List<WeaponsModel> weapons =
          data.map((json) => WeaponsModel.fromJson(json)).toList();
      int endIndex = startIndex + count;
      if (endIndex > weapons.length) {
        endIndex = weapons.length;
      }
      return weapons.sublist(startIndex, endIndex);
    } else {
      throw Exception('Failed to load weapons');
    }
  }

  Future<WeaponsModel> getDetailWeapon(String uuidWeapon) async {
    final response =
        await http.get(Uri.parse("${Api.baseUrl}$endpoint/$uuidWeapon"));
    if (response.statusCode == 200) {
      final dataWeapons = json.decode(response.body)['data'];
      return WeaponsModel.fromJson(dataWeapons);
    } else {
      throw Exception("Failed to load detail weapons");
    }
  }
}
