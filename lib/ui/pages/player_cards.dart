import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/event/player_cards_event.dart';
import 'package:valorant_wiki/bloc/player_cards_bloc.dart';
import 'package:valorant_wiki/bloc/state/player_card_state.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';

class PlayerCards extends StatefulWidget {
  const PlayerCards({super.key});

  @override
  State<PlayerCards> createState() => _PlayerCardsState();
}

class _PlayerCardsState extends State<PlayerCards> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 60.0) {
      final currentState = BlocProvider.of<PlayerCardsBloc>(context).state;
      if (currentState is OnLoadedPlayerCards) {
        BlocProvider.of<PlayerCardsBloc>(context)
            .add(LoadMorePlayerCardEvent());
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
            AppStrings.textPlayerCards,
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
        body: BlocBuilder<PlayerCardsBloc, PlayerCardState>(
            builder: (context, state) {
          if (state is OnLoadedPlayerCards) {
            return MasonryGridView.count(
              controller: _scrollController,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: state.playerCards.length,
              itemBuilder: (context, index) {
                return StaggeredImageContent(
                  urlImage: state.playerCards[index].largeArt,
                  onTap: () {},
                  extent: (index % 2 + 3) * 100.0,
                );
              },
            );
          } else if (state is OnLoadingPlayerCards) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.redValorant,
              ),
            );
          }
          return const SizedBox();
        }));
  }
}
