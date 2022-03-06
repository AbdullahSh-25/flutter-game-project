import 'package:flutter/material.dart';

import '../../models/game_repo.dart';

class failCase extends StatelessWidget {
  const failCase({
    Key? key,
    required this.repoData,
  }) : super(key: key);

  final RepoData repoData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.wifi_off_rounded,
            size: 90,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Somthing Gone Rong',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
