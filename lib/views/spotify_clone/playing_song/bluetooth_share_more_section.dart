import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:high_in_flutter/configs/utils.dart';

import '../../../configs/app_colors.dart';

class BluetoothShareMoreSection extends StatelessWidget {
  const BluetoothShareMoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          const Icon(
            Icons.bluetooth,
            size: 18,
            color: AppColors.spotifyGreen,
          ),
          Text(
            "SITSIILIA'S AIRPODS PRO",
            style: appTextStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: AppColors.spotifyGreen,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.ios_share_rounded,
            size: 20,
            color: AppColors.spotifyGreen,
          ),
          const SizedBox(
            width: 16,
          ),
          Image.asset(
           AppConstants.queueIcon,
            width: 14,
            height: 14,
          ),
        ],
      ),
    );
  }
}
