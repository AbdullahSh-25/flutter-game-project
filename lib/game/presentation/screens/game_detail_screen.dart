import 'package:bloc_test_one/game/models/game_repo.dart';
import 'package:bloc_test_one/game/models/games.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database/db.dart';
import '../widget/sliver_appbar.dart';
import '../widget/text_detail.dart';

class GameDetailScreen extends StatefulWidget {
  Results game;

  GameDetailScreen(this.game);

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late RepoData repoData;

  @override
  Widget build(BuildContext context) {
    return Provider<MyDatabase>(
      create: ((context) => MyDatabase()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              buildSliverAppBar(game: widget.game),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 13,
                          ),
                          buildTextDetail(
                              title: 'Released At :  ',
                              detail: widget.game.released!),
                          buildDivider(265),
                          buildTextDetail(
                              title: 'Genres :  ',
                              detail: widget.game.genres!.join(', ')),
                          buildDivider(300),
                          buildTextDetail(
                              title: 'Stores :  ',
                              detail: widget.game.stores!.join(', ')),
                          buildDivider(310),
                          buildTextDetail(
                              title: 'Rating :  ',
                              detail:
                                  '${widget.game.rating!} / ${widget.game.ratingTop!}'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 500,
                    )
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final database = Provider.of<MyDatabase>(context, listen: false);

              final game = Game(
                  name: widget.game.name.toString(),
                  backgroundImage: widget.game.backgroundImage.toString(),
                  genres: widget.game.genres!.join(', '),
                  rating: widget.game.rating.toString(),
                  ratingTop: widget.game.ratingTop.toString(),
                  released: widget.game.released.toString(),
                  stores: widget.game.stores!.join(', '),
                  id: widget.game.id!);

              database.insertGame(game);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'The Game Add To Favorait!',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black54,
                  duration: Duration(milliseconds: 2000),
                ),
              );
            },
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }

  Widget buildDivider(double indent) {
    return Divider(
        thickness: 3, height: 30, color: Colors.teal[200], endIndent: indent);
  }
}
