import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const Icon(
          Icons.keyboard_arrow_down,
          size: 36,
          color: Colors.white,
        ),
        const Spacer(),
        Text("Liked Songs",
            style: _textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(
          Icons.more_horiz,
          size: 36,
          color: Colors.white,
        ),
      ],
    );
  }
}
