import 'package:flutter/material.dart';
import 'package:high_in_flutter/views/adding_app_logo/add_app_logo.dart';
import 'package:high_in_flutter/views/dark_mode_implementation/dark_mode_screen.dart';
import 'package:high_in_flutter/views/page_storage_example/page_storage_example.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_player.dart';

class TableOfContent extends StatelessWidget {
  const TableOfContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screensName = [
      "Dark mode Example",
      "Preserve Scrolling State",
      "Add Flutter App logo",
      "Spotify Clone",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Table of Contents",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        key: const PageStorageKey<String>("screensName"),
        itemCount: _screensName.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              gotoScreen(index, context);
            },
            title: Text(_screensName[index],
                style: Theme.of(context).textTheme.bodyText2),
          );
        },
      ),
    );
  }
}

gotoScreen(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DarkModeScreen()));

      break;
    case 1:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PageStorageExample()));

      break;
    case 2:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddAppLogoScreen()));
      break;
    case 3:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SpotifyPlayerScreen()));

      break;
    default:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DarkModeScreen()));
  }
}
