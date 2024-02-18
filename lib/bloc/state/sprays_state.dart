import 'package:valorant_wiki/data/models/spray_model.dart';

abstract class SprayState {}

class OnLoadingSpray extends SprayState {}

class OnLoadedSpray extends SprayState {
  final List<SprayModel> sprays;
  final bool hasReachedMax;

  OnLoadedSpray({required this.sprays, required this.hasReachedMax});

  OnLoadedSpray copyWith({List<SprayModel>? sprays, bool? hasReachedMax}) {
    return OnLoadedSpray(
        sprays: sprays ?? this.sprays,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class OnErrorSpray extends SprayState {
  final String err;

  OnErrorSpray({required this.err});
}
