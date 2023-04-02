import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../presentation/widget/game_item.dart';

import '../../models/api_gettre.dart';

import '../../models/game_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/game_bloc.dart';
import '../widget/fail_case.dart';

class GamePageScreen extends StatefulWidget {
  const GamePageScreen({Key? key}) : super(key: key);

  @override
  State<GamePageScreen> createState() => _GamePageScreenState();
}

class _GamePageScreenState extends State<GamePageScreen> {
  final _scrollController = ScrollController();
  late final DataGetter dataGetter;
  late final RepoData repoData;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    dataGetter = DataGetter();
    repoData = RepoData(dataGetter: dataGetter);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        switch (state.status) {
          case GameStatus.fail:
            return const FailCase();
          case GameStatus.success:
            return RefreshIndicator(
              onRefresh: () async {
                 context.read<GameBloc>().add(GameFetched());
              },
              child: AnimationLimiter(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.hasReachedMax ? state.games!.length : state.games!.length + 1,
                  itemBuilder: ((context, index) {
                    return index >= state.games!.length
                        ? const Center(
                            child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
                          )
                        : AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 80),
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: GameItem(state.games![index]),
                              ),
                            ),
                          );
                  }),
                ),
              ),
            );
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<GameBloc>().add(GameFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.90);
  }
}
