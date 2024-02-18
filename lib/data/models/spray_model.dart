import 'package:json_annotation/json_annotation.dart';
part 'spray_model.g.dart';

@JsonSerializable(includeIfNull: true)
class SprayModel {
  String uuid;
  String displayName;
  String displayIcon;
  String fullIcon;

  SprayModel(
      {String? uuid,
      String? displayName,
      String? displayIcon,
      String? fullIcon})
      : displayName = displayName ?? "",
        uuid = uuid ?? "",
        displayIcon = displayIcon ?? "",
        fullIcon = fullIcon ??
            "https://media.valorant-api.com/sprays/3d2bcfc5-442b-812e-3c08-9180d6b36077/displayicon.png";

  factory SprayModel.fromJson(Map<String, dynamic> json) =>
      _$SprayModelFromJson(json);
  Map<String, dynamic> toJson() => _$SprayModelToJson(this);
}
