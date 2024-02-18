import 'package:json_annotation/json_annotation.dart';
import 'package:valorant_wiki/core/app_strings.dart';
part 'map_model.g.dart';

@JsonSerializable(includeIfNull: true)
class MapModel {
  String uuid;
  String displayName;
  String narrativeDescription;
  String tacticalDescription;
  String displayIcon;
  String listViewIcon;
  String splash;
  String stylizedBackgroundImage;

  MapModel(
      {String? uuid,
      String? displayName,
      String? narrativeDescription,
      String? tacticalDescription,
      String? displayIcon,
      String? listViewIcon,
      String? splash,
      String? stylizedBackgroundImage})
      : uuid = uuid ?? "",
        displayName = displayName ?? "",
        narrativeDescription = narrativeDescription ?? AppStrings.nullMapDesc,
        tacticalDescription = tacticalDescription ?? "",
        displayIcon = displayIcon ?? "",
        listViewIcon = listViewIcon ?? "",
        splash = splash ?? "",
        stylizedBackgroundImage = stylizedBackgroundImage ?? "";

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapModelToJson(this);
}
