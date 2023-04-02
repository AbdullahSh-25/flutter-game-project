import '../../presentation/widget/appdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/database/db.dart';
import '../widget/fav_game_item.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Favoraite'),
      ),
      body: _buildTaskList(context),
    );
  }

  StreamBuilder<List<Game>> _buildTaskList(BuildContext context) {
    final dao = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: dao.watchAllGames(),
      builder: (context, AsyncSnapshot<List<Game>> snapshot) {
        final tasks = snapshot.data ?? [];
        return tasks.isEmpty
            ? const Center(
                child: Text(
                  'No Games Add.. ',
                  style: TextStyle(fontSize: 25),
                ),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 13, bottom: 8),
                    child: const Center(
                        child: Text(
                      'Slide to Delete',
                      style: TextStyle(fontSize: 17),
                    )),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (_, index) {
                        final item = tasks[index];
                        return _buildListItem(item, dao, context);
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }

  Widget _buildListItem(Game item, MyDatabase dao, BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (dismissDirection) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: const Text('Are You Sure?!'),
            title: const Text('Remove From Favorait'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      onDismissed: (dismissDirection) {
        dao.deleteGame(item);
      },
      child: GameFavItem(game: item),
    );
  }
}
