// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => AgentModel(
      uuid: json['uuid'] as String,
      agentName: json['displayName'] as String,
      description: json['description'] as String,
      codeName: json['developerName'] as String,
      potraitUrl: json['bustPortrait'] as String,
      backgroundUrl: json['background'] as String,
      backgroundColor: (json['backgroundGradientColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgentModelToJson(AgentModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.agentName,
      'description': instance.description,
      'developerName': instance.codeName,
      'bustPortrait': instance.potraitUrl,
      'background': instance.backgroundUrl,
      'backgroundGradientColors': instance.backgroundColor,
      'role': instance.role,
      'abilities': instance.abilities,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      displayName: json['displayName'] as String,
      displayIcon: json['displayIcon'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      slot: json['slot'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      displayIcon: json['displayIcon'] as String?,
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'slot': instance.slot,
      'displayName': instance.displayName,
      'description': instance.description,
      'displayIcon': instance.displayIcon,
    };
