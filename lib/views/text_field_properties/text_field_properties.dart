import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPropertiesScreen extends StatefulWidget {
  const TextFieldPropertiesScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldPropertiesScreen> createState() =>
      _TextFieldPropertiesScreenState();
}

class _TextFieldPropertiesScreenState extends State<TextFieldPropertiesScreen> {
  double myNumber = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        const Text("Name"),
        Expanded(
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (val) {
              if (val.isNotEmpty) {
                setState(() {
                  myNumber = double.parse(val);
                });
              }
            },
          ),
        ),
        Text(myNumber.toString()),
      ]),
    );
  }
}
