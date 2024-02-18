import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/detail_agents_event.dart';
import 'package:valorant_wiki/bloc/state/detail_agents_state.dart';
import 'package:valorant_wiki/data/repositories/agents_repository.dart';

class DetailAgentsBloc extends Bloc<DetailAgentsEvent, DetailAgentsState> {
  DetailAgentsBloc() : super(LoadingDetailAgentsState()) {
    on<LoadDetailAgentsEvent>(((event, emit) async {
      emit(LoadingDetailAgentsState());
      try {
        final detailAgents =
            await AgentsRepository.getDetailAgents(event.uuidAgents);
        emit(LoadedDetailAgentsState(agentDetail: detailAgents));
      } catch (e) {
        emit(DetailAgentsErrorsState(e.toString()));
      }
    }));
  }
}
