import 'package:bloc_test_one/game/providers/searched_provider.dart';
import 'package:provider/provider.dart';

import '../../models/api_gettre.dart';
import '../../models/game_repo.dart';
import '../../presentation/screens/game_page_view.dart';
import '../../presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/game_bloc.dart';
import '../widget/appdrawer.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

TextEditingController textController = TextEditingController();

class _MainPageState extends State<MainPage> {
  late DataGetter dataGetter = DataGetter();

  late DataGetter gtr = dataGetter;

  late RepoData repoData = RepoData(dataGetter: gtr);

  bool ispressed = false;

  void openGamePageDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return ChangeNotifierProvider(
            create: (context) => SearchGames(),
            child: const SearchScreen(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GameBloc(
              repoData: repoData,
              search: textController.text,
            )..add(GameFetched()),
          ),
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(
              title: const Text('El Game'),
              actions: [
                IconButton(
                  onPressed: () {
                    openGamePageDetail(context);
                    setState(() {
                      ispressed = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: const GamePageScreen(),
          );
        }));
  }
}
