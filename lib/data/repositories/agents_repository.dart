import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:valorant_wiki/data/models/agent_model.dart';
import 'package:valorant_wiki/data/providers/api.dart';

class AgentsRepository {
  static Future<List<AgentModel>> getAgents(int startIndex, int count) async {
    String endpoint = "agents?isPlayableCharacter=true";
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      final List<AgentModel> agents =
          data.map((json) => AgentModel.fromJson(json)).toList();
      int endIndex = startIndex + count;
      if (endIndex > agents.length) {
        endIndex = agents.length;
      }
      return agents.sublist(startIndex, endIndex);
    } else {
      throw Exception('Failed to load agents');
    }
  }

  static Future<AgentModel> getDetailAgents(String uuid) async {
    String endpoint = "agents/$uuid";
    final response = await http.get(Uri.parse(Api.baseUrl + endpoint));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return AgentModel.fromJson(data);
    } else {
      throw Exception('Failed to load detail agents');
    }
  }
}
