import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/agents_event.dart';
import 'package:valorant_wiki/bloc/state/agents_state.dart';
import 'package:valorant_wiki/data/repositories/agents_repository.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  AgentsBloc() : super(AgentsLoadingState()) {
    on<AgentsEvent>((event, emit) async {
      if (event is LoadAgentsEvent) {
        emit(AgentsLoadingState());
        try {
          final agents = await AgentsRepository.getAgents(0, 8);
          emit(AgentsLoadedState(agents: agents, hasReachedMax: false));
        } catch (e) {
          emit(AgentsErrorState(e.toString()));
        }
      } else if (event is LoadMoreAgents) {
        final currentState = state;
        if (currentState is AgentsLoadedState) {
          try {
            final newAgents =
                await AgentsRepository.getAgents(event.startIndex, event.count);
            emit(newAgents.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : AgentsLoadedState(
                    agents: currentState.agents + newAgents,
                    hasReachedMax: false,
                  ));
          } catch (e) {
            emit(AgentsErrorState(e.toString()));
          }
        }
      }
    });
  }
}
