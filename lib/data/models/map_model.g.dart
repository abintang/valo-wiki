// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapModel _$MapModelFromJson(Map<String, dynamic> json) => MapModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      narrativeDescription: json['narrativeDescription'] as String?,
      tacticalDescription: json['tacticalDescription'] as String?,
      displayIcon: json['displayIcon'] as String?,
      listViewIcon: json['listViewIcon'] as String?,
      splash: json['splash'] as String?,
      stylizedBackgroundImage: json['stylizedBackgroundImage'] as String?,
    );

Map<String, dynamic> _$MapModelToJson(MapModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'narrativeDescription': instance.narrativeDescription,
      'tacticalDescription': instance.tacticalDescription,
      'displayIcon': instance.displayIcon,
      'listViewIcon': instance.listViewIcon,
      'splash': instance.splash,
      'stylizedBackgroundImage': instance.stylizedBackgroundImage,
    };
