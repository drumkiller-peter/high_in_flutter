import 'package:flutter/material.dart';
import 'package:high_in_flutter/body_widget.dart';

class DarkModeScreen extends StatelessWidget {
  const DarkModeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _provider = Provider.of<DarkModeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: const DarkModeExampleBodyWidget(),
    );
  }
}
