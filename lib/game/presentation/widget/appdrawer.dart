import '../../presentation/screens/main_page.dart';

import '../../presentation/screens/fav_game_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('ElGame Menu'),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: const Icon(Icons.list_alt_outlined),
          title: const Text('All'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => MainPage())));
          },
        ),
        Divider(
            color: Colors.teal[200],
            thickness: 3,
            height: 30,
            endIndent: 25,
            indent: 25),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favoraite'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => const FavScreen())));
          },
        ),
      ]),
    );
  }
}
