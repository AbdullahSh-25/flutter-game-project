import 'package:bloc_test_one/game/models/games.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/game_detail_screen.dart';

class GameItem extends StatelessWidget {
  final Results game;

  const GameItem(this.game, {Key? key}) : super(key: key);

  void openGamePageDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return GameDetailScreen(game);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openGamePageDetail(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 110,
                height: 100,
                child: Hero(
                  tag: game.id!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: game.backgroundImage!.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: game.backgroundImage!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            placeholderFadeInDuration: const Duration(milliseconds: 700),
                            placeholder: (context, _) => Image.asset(
                              'assets/image/Infinity.gif',
                            ),
                          )
                        : Image.asset('assets/image/fail.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(
                      game.name!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      game.genres!.join(', '),
                    ),
                  ),
                  Text(
                    game.released!.substring(0, 4),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Row(
                    children: [
                      Text(
                        '${game.rating!}',
                      ),
                      Text(
                        ' / ${game.ratingTop!} ',
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
