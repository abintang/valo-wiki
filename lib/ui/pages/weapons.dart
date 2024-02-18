import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/event/weapons_event.dart';
import 'package:valorant_wiki/bloc/state/weapons_state.dart';
import 'package:valorant_wiki/bloc/weapons_bloc.dart';
import 'package:valorant_wiki/ui/pages/weapon_detail.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';

class Weapons extends StatefulWidget {
  const Weapons({super.key});

  @override
  State<Weapons> createState() => _WeaponsState();
}

class _WeaponsState extends State<Weapons> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      final currentState = BlocProvider.of<WeaponsBloc>(context).state;
      if (currentState is WeaponsLoadedState) {
        BlocProvider.of<WeaponsBloc>(context).add(WeaponsLoadMoreEvent(
            startIndex: currentState.weapons.length, count: 6));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeaponsBloc>(context).add(WeaponsLoadEvent());
    _scrollController.addListener(_onScroll);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.textWeapons,
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
      body: BlocBuilder<WeaponsBloc, WeaponsState>(
        builder: (context, state) {
          if (state is WeaponsLoadedState) {
            return Padding(
                padding: EdgeInsets.fromLTRB(8.w, 1.h, 8.w, 0),
                child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 40.w,
                        childAspectRatio: 1 / 0.8,
                        crossAxisSpacing: 3.w,
                        mainAxisSpacing: 2.h),
                    itemCount:
                        state.weapons.length + (state.hasReachedMax ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index < state.weapons.length) {
                        return BorderButtonWithTitle(
                          urlImageButton: state.weapons[index].displayIcon,
                          titleButton: state.weapons[index].displayName,
                          sizeButton: 40,
                          sizeTitle: 16,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WeaponDetail(
                                          uuidWeapons:
                                              state.weapons[index].uuid,
                                        )));
                          },
                        );
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.redValorant,
                        ));
                      }
                    }));
          } else if (state is WeaponsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.redValorant,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
