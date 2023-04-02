import 'package:flutter/material.dart';

import '../../models/game_repo.dart';

class FailCase extends StatelessWidget {
  const FailCase({
    Key? key,
  }) : super(key: key);


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
            'Something Gone Wrong',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
