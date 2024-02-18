import 'package:json_annotation/json_annotation.dart';
part 'gun_buddies_model.g.dart';

@JsonSerializable(includeIfNull: true)
class GunBuddiesModel {
  String uuid;
  String displayName;
  String displayIcon;

  GunBuddiesModel({String? uuid, String? displayName, String? displayIcon})
      : uuid = uuid ?? "",
        displayName = displayName ?? "",
        displayIcon = displayIcon ?? "";

  factory GunBuddiesModel.fromJson(Map<String, dynamic> json) =>
      _$GunBuddiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GunBuddiesModelToJson(this);
}
