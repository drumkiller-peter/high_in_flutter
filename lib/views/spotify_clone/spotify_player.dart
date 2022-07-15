import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/utils.dart';
import 'package:high_in_flutter/views/spotify_clone/playing_song/bluetooth_share_more_section.dart';
import 'package:high_in_flutter/views/spotify_clone/playing_song/lyrics_widget.dart';
import 'package:high_in_flutter/views/spotify_clone/playing_song/slider_and_time_period.dart';
import 'package:high_in_flutter/views/spotify_clone/playing_song/title_tow_widget.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_provider/spotify_provider.dart';
import 'package:provider/provider.dart';

import 'playing_song/suffle_prev_play_next_buttons.dart';
import 'playing_song/title_of_song.dart';

class SpotifyPlayerScreen extends StatelessWidget {
  const SpotifyPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _imageUrl =
        "https://assets.vogue.in/photos/609bc43f330168cc92114390/master/pass/Billie-Eilish-Happier-Than-Ever.jpeg";
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => SpotifyProvider(),
        lazy: true,
        builder: (context, _) {
          Provider.of<SpotifyProvider>(context, listen: false)
              .initializeAudioPlayer();
          return Scaffold(
            backgroundColor: AppColors.darkGreyBackGround,
            body: Padding(
              padding: screenPadding,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleRowWidget(),
                      SizedBox(
                        height: _size.height * 0.05,
                      ),
                      CachedNetworkImage(
                        height: 359,
                        width: _size.width,
                        fit: BoxFit.fitHeight,
                        imageUrl: _imageUrl,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      const TitleOfSong(),
                      SizedBox(
                        height: _size.height * 0.025,
                      ),
                      const SliderandTimePeriodWidget(),
                      SizedBox(
                        height: _size.height * 0.025,
                      ),
                      const SufflePrevPlayNextButtonWidget(),
                      SizedBox(
                        height: _size.height * 0.025,
                      ),
                      const BluetoothShareMoreSection(),
                    ],
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.07,
                    maxChildSize: 0.5,
                    minChildSize: 0.07,
                    snap: true,
                    expand: true,
                    snapSizes: const [0.18, 0.5],
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                          // height: 300,
                          decoration: BoxDecoration(
                            color: AppColors.lightBrown,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: const [
                              LyricsWidget(),
                            ],
                          ));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
