import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valorant_wiki/bloc/detail_agents_bloc.dart';
import 'package:valorant_wiki/bloc/event/detail_agents_event.dart';
import 'package:valorant_wiki/bloc/state/detail_agents_state.dart';
import 'package:valorant_wiki/ui/widgets/side_components.dart';
import 'package:valorant_wiki/ui/widgets/background_triangle.dart';
import 'package:valorant_wiki/core/app_colors.dart';
import 'package:valorant_wiki/core/app_strings.dart';

class AgentDetail extends StatefulWidget {
  final String uuid;
  const AgentDetail({super.key, required this.uuid});

  @override
  State<AgentDetail> createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  @override
  Widget build(BuildContext context) {
    String uuidAgents = widget.uuid;
    BlocProvider.of<DetailAgentsBloc>(context)
        .add(LoadDetailAgentsEvent(uuidAgents));
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            right: 0,
            top: 0,
            child: Triangle(heightTriangle: 18),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "${AppStrings.textAgents} ${AppStrings.textDetails}",
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
              const DetailAgentsComponent()
            ],
          ),
        ],
      ),
    );
  }
}

class DetailAgentsComponent extends StatefulWidget {
  const DetailAgentsComponent({super.key});

  @override
  State<DetailAgentsComponent> createState() => _DetailAgentsComponentState();
}

class _DetailAgentsComponentState extends State<DetailAgentsComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailAgentsBloc, DetailAgentsState>(
        builder: (context, state) {
      if (state is LoadedDetailAgentsState) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Center(
                      child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: state.agentDetail.backgroundUrl,
                    width: 60.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  )),
                  Center(
                      child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: state.agentDetail.potraitUrl,
                    width: 50.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  )),
                ]),
                SizedBox(height: 2.h),
                TextComponent(
                  componentCategory: AppStrings.textName,
                  componentValue: state.agentDetail.agentName,
                  hasIcon: false,
                ),
                const DividerLine(),
                TextComponent(
                    componentCategory: AppStrings.textCodeName,
                    hasIcon: false,
                    componentValue: state.agentDetail.codeName),
                const DividerLine(),
                TextComponent(
                    componentCategory: AppStrings.textType,
                    hasIcon: true,
                    urlIcon: state.agentDetail.role!.displayIcon,
                    componentValue: state.agentDetail.role!.displayName),
                const DividerLine(),
                DescriptionText(
                  descValue: state.agentDetail.description,
                  hasLeftRightMargin: true,
                  fontSize: 16,
                ),
                const DividerLine(),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Text(
                    "${AppStrings.textAbilities}:",
                    style: TextStyle(
                        color: AppColors.redValorant, fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                LimitedBox(
                  maxHeight: 43.h,
                  child: ListView.builder(
                      itemCount: state.agentDetail.abilities!.length,
                      padding: EdgeInsets.only(left: 8.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AbilitiesSection(
                            abilitiesSlot:
                                state.agentDetail.abilities![index].slot,
                            abilitiesName:
                                state.agentDetail.abilities![index].displayName,
                            urlIconAbilities:
                                state.agentDetail.abilities![index].displayIcon,
                            abilitiesDescription: state
                                .agentDetail.abilities![index].description);
                      }),
                ),
                SizedBox(height: 2.h)
              ],
            ),
          ),
        );
      } else if (state is LoadingDetailAgentsState) {
        return Container(
          margin: EdgeInsets.only(top: 45.h),
          child: const CircularProgressIndicator(
            color: AppColors.redValorant,
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
