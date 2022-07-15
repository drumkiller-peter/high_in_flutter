import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/utils.dart';

class TitleOfSong extends StatelessWidget {
  const TitleOfSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Happier Than Ever",
              style: appTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              "Billie Eilish",
              style: appTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.67),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.favorite,
          size: 24,
          color: AppColors.spotifyGreen,
        ),
      ],
    );
  }
}
