import 'package:json_annotation/json_annotation.dart';
part 'agent_model.g.dart';

@JsonSerializable(includeIfNull: true)
class AgentModel {
  String uuid;
  @JsonKey(name: "displayName")
  String agentName;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "developerName")
  String codeName;
  @JsonKey(name: "bustPortrait")
  String potraitUrl;
  @JsonKey(name: "background")
  String backgroundUrl;
  @JsonKey(name: "backgroundGradientColors")
  List<String> backgroundColor;
  @JsonKey(name: "role")
  Role? role;
  @JsonKey(name: "abilities")
  List<Abilities>? abilities;

  AgentModel({
    required this.uuid,
    required this.agentName,
    required this.description,
    required this.codeName,
    required this.potraitUrl,
    required this.backgroundUrl,
    required this.backgroundColor,
    this.role,
    this.abilities,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Role {
  String displayName;
  String displayIcon;

  Role({required this.displayName, required this.displayIcon});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Abilities {
  String slot;
  String displayName;
  String description;
  String displayIcon;

  Abilities(
      {required this.slot,
      required this.displayName,
      required this.description,
      String? displayIcon})
      : displayIcon = displayIcon ??
            "https://media.valorant-api.com/agents/41fb69c1-4189-7b37-f117-bcaf1e96f1bf/abilities/passive/displayicon.png";

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}
