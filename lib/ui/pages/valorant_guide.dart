import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/ui/pages/agents.dart';
import 'package:valorant_wiki/ui/pages/gun_buddies.dart';
import 'package:valorant_wiki/ui/pages/maps.dart';
import 'package:valorant_wiki/ui/pages/player_cards.dart';
import 'package:valorant_wiki/ui/pages/sprays.dart';
import 'package:valorant_wiki/ui/pages/weapons.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';

class ValorantGuide extends StatelessWidget {
  const ValorantGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.textValorantGuide,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.w, 2.h, 8.w, 0),
          child: Column(
            children: [
              BorderButton(
                  textButton: AppStrings.textAgents,
                  imageButtonName: "agents.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Agents()));
                  }),
              BorderButton(
                  textButton: AppStrings.textWeapons,
                  imageButtonName: "weapons.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Weapons()));
                  }),
              BorderButton(
                  textButton: AppStrings.textSprays,
                  imageButtonName: "sprays.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Sprays()));
                  }),
              BorderButton(
                  textButton: AppStrings.textPlayerCards,
                  imageButtonName: "cards.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayerCards()));
                  }),
              BorderButton(
                  textButton: AppStrings.textMaps,
                  imageButtonName: "maps.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Maps()));
                  }),
              BorderButton(
                  textButton: AppStrings.textGunBuddies,
                  imageButtonName: "gunbuddies.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GunBuddies()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
