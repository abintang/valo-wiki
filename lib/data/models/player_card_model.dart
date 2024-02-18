import 'package:json_annotation/json_annotation.dart';
part 'player_card_model.g.dart';

@JsonSerializable(includeIfNull: true)
class PlayerCardModel {
  String uuid;
  String displayName;
  String displayIcon;
  String largeArt;

  PlayerCardModel(
      {String? uuid,
      String? displayName,
      String? displayIcon,
      String? largeArt})
      : uuid = uuid ?? "",
        displayName = displayName ?? "",
        displayIcon = displayIcon ?? "",
        largeArt = largeArt ?? "";

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerCardModelToJson(this);
}
