import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/agents_bloc.dart';
import 'package:valorant_wiki/bloc/detail_agents_bloc.dart';
import 'package:valorant_wiki/bloc/detail_weapon_bloc.dart';
import 'package:valorant_wiki/bloc/event/gun_buddies_event.dart';
import 'package:valorant_wiki/bloc/event/maps_event.dart';
import 'package:valorant_wiki/bloc/event/player_cards_event.dart';
import 'package:valorant_wiki/bloc/event/sprays_event.dart';
import 'package:valorant_wiki/bloc/gun_buddies_bloc.dart';
import 'package:valorant_wiki/bloc/maps_bloc.dart';
import 'package:valorant_wiki/bloc/player_cards_bloc.dart';
import 'package:valorant_wiki/bloc/skin_weapon_bloc.dart';
import 'package:valorant_wiki/bloc/sprays_bloc.dart';
import 'package:valorant_wiki/bloc/weapons_bloc.dart';
import 'package:valorant_wiki/ui/pages/valorant_guide.dart';
import 'package:valorant_wiki/core/app_colors.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AgentsBloc>(create: (BuildContext context) => AgentsBloc()),
    BlocProvider<DetailAgentsBloc>(
        create: (BuildContext context) => DetailAgentsBloc()),
    BlocProvider<WeaponsBloc>(create: (BuildContext context) => WeaponsBloc()),
    BlocProvider<DetailWeaponBloc>(
        create: (BuildContext context) => DetailWeaponBloc()),
    BlocProvider<SkinWeaponBloc>(
        create: (BuildContext context) => SkinWeaponBloc()),
    BlocProvider<MapsBloc>(
        create: (BuildContext context) => MapsBloc()..add(LoadMapEvent())),
    BlocProvider<PlayerCardsBloc>(
        create: (BuildContext context) =>
            PlayerCardsBloc()..add(LoadPlayerCardEvent())),
    BlocProvider<SpraysBloc>(
        create: (BuildContext context) => SpraysBloc()..add(LoadSprayEvent())),
    BlocProvider<GunBuddiesBloc>(
        create: (BuildContext context) =>
            GunBuddiesBloc()..add(LoadGunBuddiesEvent())),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.backgroundColor,
                fontFamily: 'BowlbyOneSC'),
            home: const ValorantGuide());
      },
    );
  }
}
