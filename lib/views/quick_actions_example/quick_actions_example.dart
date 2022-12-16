import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/views/masking_text_with_image/masking_text_with_image.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_player.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionExample extends StatefulWidget {
  const QuickActionExample({Key? key}) : super(key: key);

  @override
  State<QuickActionExample> createState() => _QuickActionExampleState();
}

class _QuickActionExampleState extends State<QuickActionExample> {
  late QuickActions quickActions;
  @override
  void initState() {
    quickActions = const QuickActions();
    initQuickAction(context);
    super.initState();
  }

  void initQuickAction(BuildContext context) {
    quickActions.initialize(
      (String shortcutType) {
        if (shortcutType == 'action_mail') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SpotifyPlayerScreen(),
              ),
              (route) => false);
        }
        if (shortcutType == 'action_contact') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MaskTextWithImageScreen(),
              ),
              (route) => false);
        }
      },
    );
    quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
            type: 'action_mail', localizedTitle: 'Emails', icon: 'mail'),
        const ShortcutItem(
          type: 'action_contact',
          localizedTitle: 'Contacts',
          icon: 'contact',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: "Quick Actions"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text(
              "Now Minimize the App,or Close the app and Long press on the App icon to see the Results.",
              style: TextStyle(
                color: AppColors.spotifyGreen,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
