import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/gun_buddies_bloc.dart';
import 'package:valorant_wiki/bloc/state/gun_buddies_state.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';

class GunBuddies extends StatelessWidget {
  const GunBuddies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.textGunBuddies,
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
      body: BlocBuilder<GunBuddiesBloc, GunBuddiesState>(
        builder: ((context, state) {
          if (state is OnLoadedGunBuddies) {
            return Padding(
                padding: EdgeInsets.fromLTRB(8.w, 1.h, 8.w, 0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 40.w,
                        childAspectRatio: 1 / 0.8,
                        crossAxisSpacing: 3.w,
                        mainAxisSpacing: 2.h),
                    itemCount: state.gunBuddies.length,
                    itemBuilder: (context, index) {
                      return BorderButtonWithTitle(
                        urlImageButton: state.gunBuddies[index].displayIcon,
                        titleButton: state.gunBuddies[index].displayName,
                        sizeButton: 20,
                        sizeTitle: 13,
                        onTap: () {},
                      );
                    }));
          } else if (state is OnLoadingGunBuddies) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.redValorant,
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
