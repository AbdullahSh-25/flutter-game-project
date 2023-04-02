import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../database/db.dart';

class GameFavItem extends StatefulWidget {
  final Game game;

  const GameFavItem({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<GameFavItem> createState() => _GameFavItemState();
}

class _GameFavItemState extends State<GameFavItem> with SingleTickerProviderStateMixin {
  late final AnimationController slideAnimation ;

  late final Animation<Offset> tween;
  @override
  void initState() {
    super.initState();
    slideAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();

    tween = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(slideAnimation);
  }


  @override
  void dispose() {
    super.dispose();
    slideAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: tween,
      child: InkWell(
        onTap: () => {},
        child: VisibilityDetector(
          onVisibilityChanged: (val){
            print(val.visibleFraction);
          },
          key: GlobalKey(),
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
                      tag: widget.game.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: widget.game.backgroundImage.isNotEmpty
                            ? FadeInImage.assetNetwork(
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: 'assets/image/Infinity.gif',
                                image: widget.game.backgroundImage,
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
                          widget.game.name,
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
                          widget.game.genres,
                        ),
                      ),
                      Text(
                        widget.game.released.substring(0, 4),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.game.rating,
                          ),
                          Text(
                            ' / ${widget.game.ratingTop} ',
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
        ),
      ),
    );
  }
}
