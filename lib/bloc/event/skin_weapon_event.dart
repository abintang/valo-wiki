abstract class SkinWeaponEvent {
  SkinWeaponEvent();
}

class LoadSkinsWeaponEvent extends SkinWeaponEvent {
  final String uuidWeapons;

  LoadSkinsWeaponEvent({required this.uuidWeapons});
}

class LoadMoreSkinsWeaponEvent extends SkinWeaponEvent {
  final String uuidWeapons;

  LoadMoreSkinsWeaponEvent({required this.uuidWeapons});
}
