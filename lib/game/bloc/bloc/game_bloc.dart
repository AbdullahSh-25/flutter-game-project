
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../models/game_repo.dart';
import '../../models/games.dart';

part 'game_event.dart';
part 'game_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GameBloc extends Bloc<GameEvent, GameState> {
  final RepoData repoData;
  String search;
  GameBloc({
    required this.search,
    required this.repoData,
  }) : super(const GameState()) {
    on<GameFetched>(
      handler,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> handler(GameEvent event, Emitter<GameState> emit) async {
    try {

      if (state.hasReachedMax) return;
      if (state.status == GameStatus.initial) {
        final gamelst = await repoData.pageGetter();
        return emit(state.copyWith(
          status: GameStatus.success,
          games: gamelst,
          hasReachedMax: false,
        ));
      }

      if (state.status == GameStatus.success) {
        final gamelst = await repoData.pageGetter();
        gamelst.isEmpty
            ? emit(state.copyWith(
                status: GameStatus.success,
                games: gamelst,
                hasReachedMax: true,
              ))
            : emit(state.copyWith(
                status: GameStatus.success,
                games: List.of(state.games!)..addAll(gamelst),
                hasReachedMax: false));
      }
    } catch (error) {
      emit(state.copyWith(status: GameStatus.fail));
    }
  }
}
