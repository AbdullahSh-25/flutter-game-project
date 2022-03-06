import 'package:flutter/material.dart';

import '../../models/games.dart';

class buildSliverAppBar extends StatelessWidget {
  const buildSliverAppBar({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Results game;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          game.name!,
          style: const TextStyle(fontSize: 20, overflow: TextOverflow.fade),
          maxLines: 1,
        ),
        background: Hero(
          tag: game.id!,
          child: FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            placeholder: 'assets/image/Infinity.gif',
            image: game.backgroundImage!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
