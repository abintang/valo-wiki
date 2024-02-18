import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/detail_weapon_event.dart';
import 'package:valorant_wiki/bloc/state/detail_weapon_state.dart';
import 'package:valorant_wiki/data/repositories/weapons_repository.dart';

class DetailWeaponBloc extends Bloc<DetailWeaponEvent, DetailWeaponState> {
  DetailWeaponBloc() : super(LoadingDetailWeaponState()) {
    on<LoadDetailWeaponEvent>((event, emit) async {
      emit(LoadingDetailWeaponState());
      try {
        final detailWeapon =
            await WeaponsRepository().getDetailWeapon(event.uuidWeapons);
        emit(LoadedDetailWeaponState(weaponsModel: detailWeapon));
      } catch (e) {
        emit(ErrorDetailWeaponState(error: e.toString()));
      }
    });
  }
}
