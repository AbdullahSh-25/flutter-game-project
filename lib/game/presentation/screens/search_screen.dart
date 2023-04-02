import 'package:provider/provider.dart';
import '../../models/api_gettre.dart';
import '../../models/game_repo.dart';
import '../../presentation/screens/main_page.dart';
import 'package:flutter/material.dart';
import '../../providers/searched_provider.dart';
import '../widget/fail_case.dart';
import '../widget/game_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late DataGetter dataGetter = DataGetter();

  late DataGetter gtr = dataGetter;

  late RepoData repoData = RepoData(dataGetter: gtr);

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<SearchGames>(context).items;

    return Scaffold(
      appBar: AppBar(
        actions: [
          buildTextField(context),
          IconButton(
            onPressed: () {
              setState(() {
                _onSubmitted(textController.text);
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: context.read<SearchGames>().isSearching?
      const Center(child: CircularProgressIndicator()):
      game.isNotEmpty
          ? ListView.builder(
              itemCount: game.length,
              itemBuilder: ((context, index) {
                return GameItem(game[index]);
              }),
            )
          : const FailCase(),
    );
  }

  @override
  void dispose() {
    textController.clear();
    _focusNode.dispose();
    super.dispose();
  }

  Widget buildTextField(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: TextField(
            focusNode: _focusNode,
            controller: textController,
            onSubmitted: (val) => _onSubmitted(val),
            textInputAction: TextInputAction.go,
            autofocus: true,
            cursorHeight: 20,
            decoration: const InputDecoration(
              hintText: 'Enter Game Name...',
              border: InputBorder.none,
            ),
          ),
          width: 250,
        ),
        IconButton(
          onPressed: () {
            textController.clear();
            _focusNode = FocusNode();
          },
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }

  _onSubmitted(String val) {
    Provider.of<SearchGames>(context, listen: false).search(val);
    setState(() {
      _focusNode.unfocus();
    });
  }
}
