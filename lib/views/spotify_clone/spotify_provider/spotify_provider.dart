import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SpotifyProvider extends ChangeNotifier {
  @override
  void dispose() {
    disposeAudioPlayer();
    super.dispose();
  }

  AudioPlayer player = AudioPlayer();
  String finalTime = "";
  String startingTime = "00:00";
  double sliderMinValue = 0.0;
  double sliderMaxValue = 0.0;
  double sliderCurrentValue = 0.0;

  appendZero(String value) {
    if (value.length == 1) {
      value = "0" + value;
      return value;
    } else {
      return value;
    }
  }

  getDuration(Duration d) {
    var hours = d.inHours.remainder(24) <= 0 ? 0 : d.inHours;
    var hoursInString = hours <= 0 ? "" : "${hours.toString()} : ";
    var t = hoursInString +
        appendZero(d.inMinutes.remainder(60).toString()) +
        ":" +
        appendZero(d.inSeconds.remainder(60).toString());
    return t;
  }

  initializeAudioPlayer() async {
    try {
      // await player.setAsset(AppConstants.mp3Assest);// unComment this for loading from Assest
      await player.setUrl(
          "https://p.scdn.co/mp3-preview/40821a698364f0bf84b15bcc71a40ef813fff0e1?cid=774b29d4f13844c495f206cafdad9c86");
      finalTime = getDuration(player.duration!);
      sliderMaxValue = double.parse(player.duration!.inSeconds.toString());
      pausePlayPlayer();
      getStartingTimeTimer();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  pausePlayPlayer() async {
    player.playing ? await player.pause() : await player.play();
  }

  forwardTenSec() async {
    if (player.playing) {
      if (sliderCurrentValue != sliderMaxValue) {
        await player.seek(Duration(seconds: sliderCurrentValue.floor() + 10));
      } else if (sliderCurrentValue == sliderMaxValue) {
        await player.seek(Duration(seconds: player.duration!.inSeconds));
      } else {
        await player.seek(const Duration(seconds: 0));
      }
    }
    notifyListeners();
  }

  reverseTenSec() async {
    if (player.playing) {
      if (sliderCurrentValue > 10) {
        await player.seek(Duration(seconds: sliderCurrentValue.floor() - 10));
        notifyListeners();
      } else {
        player.seek(const Duration(seconds: 0));
        notifyListeners();
      }
    }
  }

  getStartingTimeTimer() {
    player.positionStream.listen((event) async {
      if (double.parse(event.inSeconds.toString()) == sliderMaxValue) {
        startingTime = getDuration(event);
        await player.stop();
      } else {
        startingTime = getDuration(event);
        sliderCurrentValue = double.parse(event.inSeconds.toString());
      }
      notifyListeners();
    });
  }

  onChangedSlider(double duration) async {
    if (player.playing) {
      await player.pause();
      sliderCurrentValue = duration;
      await player.seek(Duration(seconds: duration.floor()));
      await player.play();
    } else {
      sliderCurrentValue = duration;
      await player.seek(Duration(seconds: duration.floor()));
      await player.play();
    }
    notifyListeners();
  }

  disposeAudioPlayer() async {
    player.positionStream.listen((event) {}).cancel();
    await player.stop();
    await player.dispose();
  }
}
