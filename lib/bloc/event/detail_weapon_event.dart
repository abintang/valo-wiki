abstract class DetailWeaponEvent {
  const DetailWeaponEvent();
}

class LoadDetailWeaponEvent extends DetailWeaponEvent {
  final String uuidWeapons;

  LoadDetailWeaponEvent({required this.uuidWeapons});
}
