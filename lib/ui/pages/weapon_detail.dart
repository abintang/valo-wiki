import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valorant_wiki/bloc/detail_weapon_bloc.dart';
import 'package:valorant_wiki/bloc/event/detail_weapon_event.dart';
import 'package:valorant_wiki/bloc/event/skin_weapon_event.dart';
import 'package:valorant_wiki/bloc/skin_weapon_bloc.dart';
import 'package:valorant_wiki/bloc/state/detail_weapon_state.dart';
import 'package:valorant_wiki/bloc/state/skin_weapon_state.dart';
import 'package:valorant_wiki/ui/widgets/side_components.dart';
import 'package:valorant_wiki/ui/widgets/background_triangle.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeaponDetail extends StatefulWidget {
  final String uuidWeapons;
  const WeaponDetail({super.key, required this.uuidWeapons});

  @override
  State<WeaponDetail> createState() => _WeaponDetailState();
}

class _WeaponDetailState extends State<WeaponDetail> {
  @override
  Widget build(BuildContext context) {
    String uuidWeapons = widget.uuidWeapons;
    BlocProvider.of<DetailWeaponBloc>(context)
        .add(LoadDetailWeaponEvent(uuidWeapons: uuidWeapons));
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              top: 0, right: 0, child: Triangle(heightTriangle: 30)),
          Column(children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "${AppStrings.textWeapons} ${AppStrings.textDetails}",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              leading: Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.redValorant,
                    size: 6.w,
                  ),
                ),
              ),
              centerTitle: true,
            ),
            BlocBuilder<DetailWeaponBloc, DetailWeaponState>(
                builder: (context, state) {
              if (state is LoadedDetailWeaponState) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                          child: Center(
                            child: FadeInImage.memoryNetwork(
                              image: state.weaponsModel.displayIcon,
                              placeholder: kTransparentImage,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextComponent(
                            componentCategory:
                                "${AppStrings.textWeapons} ${AppStrings.textName}",
                            componentValue: state.weaponsModel.displayName,
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory:
                                "${AppStrings.textWeapons} ${AppStrings.textCategory}",
                            componentValue: state.weaponsModel.category
                                .split("EEquippableCategory::")
                                .last,
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory: AppStrings.textCreds,
                            componentValue:
                                state.weaponsModel.shopData.cost.toString(),
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory: AppStrings.textMagazine,
                            componentValue:
                                "${state.weaponsModel.weaponStats.magazineSize} Ammo",
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory: AppStrings.textWallPenetration,
                            componentValue: state
                                .weaponsModel.weaponStats.wallPenetration
                                .split("EWallPenetrationDisplayType::")
                                .last,
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory:
                                "${AppStrings.textFire} ${AppStrings.textRate}",
                            componentValue:
                                "${state.weaponsModel.weaponStats.fireRate} Rounds/Sec",
                            hasIcon: false),
                        const DividerLine(),
                        TextComponent(
                            componentCategory: AppStrings.textReloadTime,
                            componentValue:
                                "${state.weaponsModel.weaponStats.reloadTimeSeconds} Seconds",
                            hasIcon: false),
                        const DividerLine(),
                        Center(
                          child: Text(
                            AppStrings.textDamage,
                            style: TextStyle(
                                color: AppColors.redValorant, fontSize: 16.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                          child: Table(
                            children: [
                              for (int i = 0; i < 5; i++)
                                TableRow(children: [
                                  Center(
                                    child: Text(
                                      (i == 0)
                                          ? AppStrings.textBody
                                          : (20 * (i + 1)).toString(),
                                      style: (i == 0)
                                          ? TextStyle(
                                              color: AppColors.redValorant,
                                              fontSize: 16.sp)
                                          : TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      (i == 0)
                                          ? AppStrings.textHead
                                          : (20 * (i + 2)).toString(),
                                      style: (i == 0)
                                          ? TextStyle(
                                              color: AppColors.redValorant,
                                              fontSize: 16.sp)
                                          : TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      (i == 0)
                                          ? AppStrings.textLeg
                                          : (20 * (i + 0.5)).toString(),
                                      style: (i == 0)
                                          ? TextStyle(
                                              color: AppColors.redValorant,
                                              fontSize: 16.sp)
                                          : TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                    ),
                                  ),
                                ])
                            ],
                          ),
                        ),
                        const DividerLine(),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.w, right: 8.w, top: 2.h),
                          child: Text(
                            "${AppStrings.textSkins}:",
                            style: TextStyle(
                                color: AppColors.redValorant, fontSize: 16.sp),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListSkins(uuidWeapons: uuidWeapons),
                      ],
                    ),
                  ),
                );
              } else if (state is LoadingDetailWeaponState) {
                return Container(
                  margin: EdgeInsets.only(top: 45.h),
                  child: const CircularProgressIndicator(
                    color: AppColors.redValorant,
                  ),
                );
              }
              return Container(
                width: 20.w,
                color: AppColors.testColor,
              );
            })
          ])
        ],
      ),
    );
  }
}

class ListSkins extends StatefulWidget {
  final String uuidWeapons;
  const ListSkins({super.key, required this.uuidWeapons});

  @override
  State<ListSkins> createState() => _ListSkinsState();
}

class _ListSkinsState extends State<ListSkins> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      final currentState = BlocProvider.of<SkinWeaponBloc>(context).state;
      if (currentState is LoadedSkinWeaponState) {
        BlocProvider.of<SkinWeaponBloc>(context)
            .add(LoadMoreSkinsWeaponEvent(uuidWeapons: widget.uuidWeapons));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_onScroll);
    BlocProvider.of<SkinWeaponBloc>(context)
        .add(LoadSkinsWeaponEvent(uuidWeapons: widget.uuidWeapons));
    return BlocBuilder<SkinWeaponBloc, SkinWeaponState>(
        builder: (context, state) {
      if (state is LoadedSkinWeaponState) {
        return LimitedBox(
          maxHeight: 15.h,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: state.skins.length + (state.hasReachedMax ? 0 : 1),
              padding: EdgeInsets.only(left: 8.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index < state.skins.length) {
                  return Container(
                      width: 50.w,
                      margin: EdgeInsets.only(right: 2.w),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.redValorant, width: 0.2.w),
                          borderRadius: BorderRadiusDirectional.circular(1.w)),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: state.skins[index].displayIcon));
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.redValorant,
                  ));
                }
              }),
        );
      } else {
        return Container(
          width: 100.w,
          color: AppColors.testColor,
        );
      }
    });
  }
}
