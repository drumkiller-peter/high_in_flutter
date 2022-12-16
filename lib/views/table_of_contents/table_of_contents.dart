import 'package:flutter/material.dart';
import 'package:high_in_flutter/custom_animations/custom_animations.dart';
import 'package:high_in_flutter/views/adding_app_logo/add_app_logo.dart';
import 'package:high_in_flutter/views/adding_marquee/adding_marquee.dart';
import 'package:high_in_flutter/views/dark_mode_implementation/dark_mode_screen.dart';
import 'package:high_in_flutter/views/extension_in_dart/extenison_in_dart.dart';
import 'package:high_in_flutter/views/masking_text_with_image/masking_text_with_image.dart';
import 'package:high_in_flutter/views/page_storage_example/page_storage_example.dart';
import 'package:high_in_flutter/views/quick_actions_example/quick_actions_example.dart';
import 'package:high_in_flutter/views/shimmer_effect/shimmer_loading_screen.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_player.dart';
import 'package:high_in_flutter/views/text_field_properties/text_field_properties.dart';
import 'package:provider/provider.dart';

import '../scrolling_behaviour/scrolling_behaviour_in_dart.dart';

class TableOfContent extends StatelessWidget {
  const TableOfContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screensName = [
      "Dark mode Example",
      "Preserve Scrolling State",
      "Add Flutter App logo",
      "Spotify Clone",
      "Marquee Example",
      "Singleton in Dart/Flutter",
      "Scroll Behavior",
      "Text Field Properties",
      "Shimmers",
      "Mask Text with Image",
      "Custom Animations",
      "Extension in dart",
      "Quick Actions"
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MaskTextWithImageScreen(),
              ),
              (route) => false);
        },
        child: const Icon(Icons.add),
      ),
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
            title: Text(
              _screensName[index],
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }
}

gotoScreen(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DarkModeScreen(),
        ),
      );

      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PageStorageExample(),
        ),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddAppLogoScreen(),
        ),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SpotifyPlayerScreen(),
        ),
      );

      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddingMarquee(),
        ),
      );

      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SingletonInDartFlutter(),
        ),
      );

      break;
    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => MyScrollProvider(),
              lazy: true,
              builder: (context, _) => const ScrollingBehaviourInDart()),
        ),
      );

      break;
    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TextFieldPropertiesScreen(),
        ),
      );
      break;
    case 8:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ShimmerLoadingScreen(),
        ),
      );
      break;
    case 9:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MaskTextWithImageScreen(),
        ),
      );
      break;
    case 10:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomAnimations(),
        ),
      );
      break;
    case 11:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExtensionInDartScreen(),
        ),
      );
      break;
    case 12:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const QuickActionExample(),
        ),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DarkModeScreen(),
        ),
      );
  }
}
