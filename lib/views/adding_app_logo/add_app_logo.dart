import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:high_in_flutter/configs/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class AddAppLogoScreen extends StatelessWidget {
  const AddAppLogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _imageList = [
      AppConstants.appLogoExample1,
      AppConstants.appLogoExample2,
      AppConstants.appLogoExample3,
      AppConstants.appLogoExample4,
      AppConstants.appLogoExample5,
    ];
    PageController cc = PageController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adding logo"),
          actions: [
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: AppColors.white,
                    context: context,
                    builder: (context) {
                      return const CupertinoAlertDialog(
                        title: Text("Sorry!"),
                        content: Text(
                            "This download functionality will be added soon"),
                      );
                    });
              },
              child: const Icon(
                Icons.download,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await _launchUrl();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.spotifyGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("https://pub.dev/packages/url_launcher"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SmoothPageIndicator(
              controller: cc, // PageController
              count: _imageList.length,
              effect: const WormEffect(
                dotColor: AppColors.spotifyGreen,
                activeDotColor: AppColors.white,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: _imageList.length,
                  controller: cc,
                  itemBuilder: (context, index) {
                    return Image.asset(_imageList[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    await launchUrl(
        Uri(scheme: 'https', path: "https://pub.dev/packages/url_launcher"));
  }
}
