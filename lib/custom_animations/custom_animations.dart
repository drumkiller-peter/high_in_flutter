import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';

class CustomAnimations extends StatefulWidget {
  const CustomAnimations({Key? key}) : super(key: key);

  @override
  State<CustomAnimations> createState() => _CustomAnimationsState();
}

class _CustomAnimationsState extends State<CustomAnimations>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  bool isTapped = false;

  @override
  void initState() {
    // TODO: implement initState

    log("Init");

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: "Custom Animations"),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: _animation,
                child: child,
              ),
              duration: const Duration(
                milliseconds: 300,
              ),
              child: !isTapped
                  ? Container(
                      height: 200,
                      width: 500,
                      key: const Key("1"),
                      decoration: BoxDecoration(
                        color: Colors.teal[300],
                      ),
                      child: Text(
                        "Tap here",
                        style: _textTheme.headline1,
                      ),
                    )
                  : Container(
                      height: 200,
                      width: 500,
                      key: const Key("2"),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff9999ff),
                            Color(0xffff9999),
                          ],
                        ),
                      ),
                      child: Text(
                        "Good boy",
                        style: _textTheme.headline1,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class WidgetX extends StatelessWidget {
  const WidgetX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff9999ff),
            Color(0xffff9999),
          ],
        ),
      ),
      child: const Text(
        "Tap here",
        // style: .headline1,
      ),
    );
  }
}

class CustomAnimationsProvider extends ChangeNotifier {
  var isTapped = false;

  changeWidget() {
    isTapped = !isTapped;
    notifyListeners();
  }
}
