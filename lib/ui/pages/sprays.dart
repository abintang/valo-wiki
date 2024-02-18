import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/sprays_bloc.dart';
import 'package:valorant_wiki/bloc/state/sprays_state.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';

class Sprays extends StatelessWidget {
  const Sprays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            AppStrings.textSprays,
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
        body: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 1.h, 8.w, 0),
            child:
                BlocBuilder<SpraysBloc, SprayState>(builder: (context, state) {
              if (state is OnLoadedSpray) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 35.w,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 3.w,
                        mainAxisSpacing: 2.h),
                    itemCount: state.sprays.length,
                    itemBuilder: (context, index) {
                      return BorderButtonOnlyImage(
                        urlImageButton: state.sprays[index].fullIcon,
                        onTap: () {},
                      );
                    });
              } else if (state is OnLoadingSpray) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.redValorant,
                  ),
                );
              }
              return const SizedBox();
            })));
  }
}
