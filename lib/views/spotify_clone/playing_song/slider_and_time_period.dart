import 'package:flutter/material.dart';
import 'package:high_in_flutter/views/spotify_clone/spotify_provider/spotify_provider.dart';
import 'package:provider/provider.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/utils.dart';

class SliderandTimePeriodWidget extends StatelessWidget {
  const SliderandTimePeriodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SpotifyProvider>(
      builder: (context, spotifyProvider, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Slider(
            min: spotifyProvider.sliderMinValue,
            max: spotifyProvider.sliderMaxValue,
            activeColor: Colors.white,
            inactiveColor: AppColors.sliderBgColor,
            value: spotifyProvider.sliderCurrentValue,
            onChanged: (double value) {
              spotifyProvider.onChangedSlider(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              children: [
                Text(
                  spotifyProvider.startingTime,
                  style: appTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.67),
                  ),
                ),
                const Spacer(),
                Text(
                  spotifyProvider.finalTime,
                  style: appTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.67),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
