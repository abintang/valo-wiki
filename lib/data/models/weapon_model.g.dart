// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponsModel _$WeaponsModelFromJson(Map<String, dynamic> json) => WeaponsModel(
      uuid: json['uuid'] as String,
      displayName: json['displayName'] as String,
      displayIcon: json['displayIcon'] as String,
      category: json['category'] as String,
      weaponStats: json['weaponStats'] == null
          ? null
          : WeaponStats.fromJson(json['weaponStats'] as Map<String, dynamic>),
      shopData: json['shopData'] == null
          ? null
          : ShopData.fromJson(json['shopData'] as Map<String, dynamic>),
      skins: (json['skins'] as List<dynamic>?)
          ?.map((e) => Skins.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeaponsModelToJson(WeaponsModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
      'category': instance.category,
      'weaponStats': instance.weaponStats,
      'shopData': instance.shopData,
      'skins': instance.skins,
    };

Skins _$SkinsFromJson(Map<String, dynamic> json) => Skins(
      displayName: json['displayName'] as String?,
      displayIcon: json['displayIcon'] as String?,
    );

Map<String, dynamic> _$SkinsToJson(Skins instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'displayIcon': instance.displayIcon,
    };

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
      cost: json['cost'] as int?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
      'cost': instance.cost,
      'category': instance.category,
    };

WeaponStats _$WeaponStatsFromJson(Map<String, dynamic> json) => WeaponStats(
      fireRate: (json['fireRate'] as num?)?.toDouble(),
      magazineSize: json['magazineSize'] as int?,
      reloadTimeSeconds: (json['reloadTimeSeconds'] as num?)?.toDouble(),
      wallPenetration: json['wallPenetration'] as String?,
      damageRanges: (json['damageRanges'] as List<dynamic>?)
          ?.map((e) => DamageRanges.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeaponStatsToJson(WeaponStats instance) =>
    <String, dynamic>{
      'fireRate': instance.fireRate,
      'magazineSize': instance.magazineSize,
      'reloadTimeSeconds': instance.reloadTimeSeconds,
      'wallPenetration': instance.wallPenetration,
      'damageRanges': instance.damageRanges,
    };

DamageRanges _$DamageRangesFromJson(Map<String, dynamic> json) => DamageRanges(
      rangeStartMeters: json['rangeStartMeters'] as int?,
      rangeEndMeters: json['rangeEndMeters'] as int?,
      headDamage: (json['headDamage'] as num?)?.toDouble(),
      bodyDamage: (json['bodyDamage'] as num?)?.toDouble(),
      legDamage: (json['legDamage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DamageRangesToJson(DamageRanges instance) =>
    <String, dynamic>{
      'rangeStartMeters': instance.rangeStartMeters,
      'rangeEndMeters': instance.rangeEndMeters,
      'headDamage': instance.headDamage,
      'bodyDamage': instance.bodyDamage,
      'legDamage': instance.legDamage,
    };
