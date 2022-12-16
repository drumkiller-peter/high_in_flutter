import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_provider/spotify_provider.dart';
import 'package:provider/provider.dart';

class ShufflePrevPlayNextButtonWidget extends StatelessWidget {
  const ShufflePrevPlayNextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(builder: (context, spotifyProvider, _) {
      return Row(
        children: [
          const Icon(
            Icons.shuffle,
            color: AppColors.spotifyGreen,
            size: 30,
          ),
          const Spacer(),
          InkWell(
            onTap: () async {
              await spotifyProvider.reverseTenSec();
            },
            child: const Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 54,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () async {
              await spotifyProvider.pausePlayPlayer();
            },
            child: Icon(
              spotifyProvider.player.playing
                  ? Icons.pause_circle
                  : Icons.play_arrow,
              color: Colors.white,
              size: 72,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              spotifyProvider.forwardTenSec();
            },
            child: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 54,
            ),
          ),
          const Spacer(),
          Image.asset(
            AppConstants.repeatIcon,
            height: 26,
            width: 21,
          ),
        ],
      );
    });
  }
}
