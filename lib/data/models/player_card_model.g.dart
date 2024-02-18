// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerCardModel _$PlayerCardModelFromJson(Map<String, dynamic> json) =>
    PlayerCardModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      displayIcon: json['displayIcon'] as String?,
      largeArt: json['largeArt'] as String?,
    );

Map<String, dynamic> _$PlayerCardModelToJson(PlayerCardModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
      'largeArt': instance.largeArt,
    };
