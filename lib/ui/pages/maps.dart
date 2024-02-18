import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/event/maps_event.dart';
import 'package:valorant_wiki/bloc/maps_bloc.dart';
import 'package:valorant_wiki/bloc/state/maps_state.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';
import 'package:valorant_wiki/ui/widgets/side_components.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      final currentState = BlocProvider.of<MapsBloc>(context).state;
      if (currentState is OnLoadedMapState) {
        BlocProvider.of<MapsBloc>(context).add(LoadMoreMapEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_onScroll);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.textMaps,
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
      body: BlocBuilder<MapsBloc, MapState>(
        builder: (context, state) {
          if (state is OnLoadedMapState) {
            bool checkIndex;
            return Padding(
                padding: EdgeInsets.fromLTRB(8.w, 1.h, 8.w, 0),
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        state.maps.length + (state.hasReachedMax ? 0 : 1),
                    itemBuilder: (context, index) {
                      ((index + 1) % 2 == 0)
                          ? checkIndex = true
                          : checkIndex = false;
                      if (index < state.maps.length) {
                        return MapsContainer(
                          urlSplashImage: state.maps[index].splash,
                          titleMap: state.maps[index].displayName,
                          descMap: state.maps[index].narrativeDescription,
                          isEven: checkIndex,
                          number: (index + 1).toString().padLeft(2, '0'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.redValorant,
                          ),
                        );
                      }
                    }));
          } else if (state is OnLoadingMapState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.redValorant,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
