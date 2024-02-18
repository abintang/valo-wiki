import 'dart:math';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:valorant_wiki/bloc/agents_bloc.dart';
import 'package:valorant_wiki/bloc/event/agents_event.dart';
import 'package:valorant_wiki/bloc/state/agents_state.dart';
import 'package:valorant_wiki/ui/pages/agent_detail.dart';
import 'package:valorant_wiki/ui/widgets/buttons.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';
import 'package:valorant_wiki/ui/widgets/side_components.dart';

class Agents extends StatelessWidget {
  const Agents({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AgentsBloc>(context).add(LoadAgentsEvent());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            AppStrings.textAgents,
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
        body: const Center(child: AgentsList()));
  }
}

class AgentsList extends StatefulWidget {
  const AgentsList({super.key});

  @override
  State<AgentsList> createState() => _AgentsListState();
}

class _AgentsListState extends State<AgentsList> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      final currentState = BlocProvider.of<AgentsBloc>(context).state;
      if (currentState is AgentsLoadedState &&
          currentState.hasReachedMax == false) {
        BlocProvider.of<AgentsBloc>(context).add(LoadMoreAgents(
          startIndex: currentState.agents.length,
          count: 4,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_onScroll);
    var random = Random();
    int number = random.nextInt(3);

    return BlocBuilder<AgentsBloc, AgentsState>(builder: (context, state) {
      if (state is AgentsLoadedState) {
        return Padding(
            padding: EdgeInsets.fromLTRB(8.w, 1.h, 8.w, 0),
            child: DynamicHeightGridView(
                controller: _scrollController,
                crossAxisCount: 2,
                shrinkWrap: true,
                itemCount: state.agents.length + (state.hasReachedMax ? 0 : 1),
                builder: (context, index) {
                  if (index < state.agents.length) {
                    return ButtonListOfAgents(
                      textAgents: state.agents[index].agentName,
                      urlButtonImage: state.agents[index].potraitUrl,
                      textRole: state.agents[index].role!.displayName,
                      codeName: state.agents[index].codeName,
                      urlRoleImage: state.agents[index].role!.displayIcon,
                      backgroundButtonColor: Color(hexToInteger(
                          state.agents[index].backgroundColor[number])),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgentDetail(
                                      uuid: state.agents[index].uuid,
                                    )));
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }));
      } else if (state is AgentsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.redValorant,
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
