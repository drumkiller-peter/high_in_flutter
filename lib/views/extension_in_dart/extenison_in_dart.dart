import 'package:flutter/material.dart';
import 'package:high_in_flutter/views/singleton_in_dart/singleton_in_dart.dart';
import 'package:intl/intl.dart';

class ExtensionInDartScreen extends StatelessWidget {
  const ExtensionInDartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: const CustomAppBar(titleText: "Extensions in Dart"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            
            Text(
              DateTime.now().getDateOnlyAsString(),
              style: textTheme.headline4,
            ),
            Text(
              DateTime.now().toChartDate(),
              style: textTheme.headline4,
            ),



            Text(
              MyDateConverter().getDateAsString,
              style: textTheme.headline4,
            ),
          ],
        ));
  }
}

extension DateTimeExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }

  String getDateOnlyAsString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toChartDate() {
    return DateFormat("MMM dd").format(this);
  }
}

class MyDateConverter {
  get getDateAsString =>
      DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
}

