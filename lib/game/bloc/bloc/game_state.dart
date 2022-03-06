part of 'game_bloc.dart';

enum GameStatus { initial, success, fail }

class GameState extends Equatable {
  final GameStatus status;
  final List<Results>? games;
  final bool hasReachedMax;

  const GameState({
     this.status=GameStatus.initial,
     this.games=const <Results>[],
     this.hasReachedMax=false,
  });

   GameState copyWith({
    GameStatus? status,
    List<Results>? games,
    bool? hasReachedMax,
  }) {
    return GameState(
      status: status ?? this.status,
      games: games ?? this.games,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'PostState{status: $status, posts: $games, hasReachedMax: $hasReachedMax}';
  }

  @override
  List<Object> get props => [status, games!, hasReachedMax];
}
