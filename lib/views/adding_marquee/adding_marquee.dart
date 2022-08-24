import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:marquee/marquee.dart';

class AddingMarquee extends StatelessWidget {
  const AddingMarquee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Marquee Example")),
      body: Column(
        children: [
          Expanded(
            child: Marquee(
              text:
                  'Add package MARQUEE to pubspec.yaml. Link:"https://pub.dev/packages/marquee"',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Image.network(
            "https://i.ytimg.com/vi/g9CmSI-bsE4/maxresdefault.jpg",
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.cover,
          ),
          Container(
              color: Colors.indigoAccent,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      color: AppColors.white,
                      child: const Text("NEWS UPDATE")),
                  Expanded(
                    child: Marquee(
                      text:
                          'Just in: La Liga sources confirm Barcelona can register six players before Rayo clash',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
