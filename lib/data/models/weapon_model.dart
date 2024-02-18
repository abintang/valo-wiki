import 'package:json_annotation/json_annotation.dart';
part 'weapon_model.g.dart';

@JsonSerializable(includeIfNull: true)
class WeaponsModel {
  String uuid;
  String displayName;
  String displayIcon;
  String category;
  WeaponStats weaponStats;
  ShopData shopData;
  List<Skins> skins;

  WeaponsModel(
      {required this.uuid,
      required this.displayName,
      required this.displayIcon,
      required this.category,
      WeaponStats? weaponStats,
      ShopData? shopData,
      List<Skins>? skins})
      : weaponStats = weaponStats ?? WeaponStats(),
        shopData = shopData ?? ShopData(),
        skins = skins ?? <Skins>[];

  factory WeaponsModel.fromJson(Map<String, dynamic> json) =>
      _$WeaponsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponsModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Skins {
  String displayName;
  String displayIcon;

  Skins({String? displayName, String? displayIcon})
      : displayName = displayName ?? "",
        displayIcon = displayIcon ??
            "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png";

  factory Skins.fromJson(Map<String, dynamic> json) => _$SkinsFromJson(json);

  Map<String, dynamic> toJson() => _$SkinsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ShopData {
  int cost;
  String category;

  ShopData({int? cost, String? category})
      : cost = cost ?? 0,
        category = category ?? "-";

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShopDataToJson(this);
}

@JsonSerializable(includeIfNull: true)
class WeaponStats {
  double fireRate;
  int magazineSize;
  double reloadTimeSeconds;
  String wallPenetration;
  List<DamageRanges> damageRanges;

  WeaponStats(
      {double? fireRate,
      int? magazineSize,
      double? reloadTimeSeconds,
      String? wallPenetration,
      List<DamageRanges>? damageRanges})
      : fireRate = fireRate ?? 0,
        magazineSize = magazineSize ?? 0,
        reloadTimeSeconds = reloadTimeSeconds ?? 0,
        wallPenetration = wallPenetration ?? "EWallPenetrationDisplayType::-",
        damageRanges = damageRanges ?? <DamageRanges>[];

  factory WeaponStats.fromJson(Map<String, dynamic> json) =>
      _$WeaponStatsFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponStatsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DamageRanges {
  int rangeStartMeters;
  int rangeEndMeters;
  double headDamage;
  double bodyDamage;
  double legDamage;

  DamageRanges(
      {int? rangeStartMeters,
      int? rangeEndMeters,
      double? headDamage,
      double? bodyDamage,
      double? legDamage})
      : rangeStartMeters = rangeStartMeters ?? 0,
        rangeEndMeters = rangeEndMeters ?? 0,
        headDamage = headDamage ?? 0,
        bodyDamage = bodyDamage ?? 0,
        legDamage = legDamage ?? 0;

  factory DamageRanges.fromJson(Map<String, dynamic> json) =>
      _$DamageRangesFromJson(json);

  Map<String, dynamic> toJson() => _$DamageRangesToJson(this);
}
