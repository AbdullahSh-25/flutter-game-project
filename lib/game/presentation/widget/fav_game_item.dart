import 'package:flutter/material.dart';

import '../../../database/db.dart';

class GameFavItem extends StatelessWidget {
  final Game game;
  const GameFavItem(this.game);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        child: Card(
          elevation: 5,
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 110,
                height: 100,
                child: Hero(
                  tag: game.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: game.backgroundImage.isNotEmpty
                        ? FadeInImage.assetNetwork(
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: 'assets/image/Infinity.gif',
                            image: game.backgroundImage,
                            fit: BoxFit.cover,
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
                      game.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      game.genres,
                    ),
                  ),
                  Text(
                    game.released.substring(0, 4),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Row(
                    children: [
                      Text(
                        game.rating,
                      ),
                      Text(
                        ' / ${game.ratingTop} ',
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
          )),
        ),
      ),
    );
  }
}
