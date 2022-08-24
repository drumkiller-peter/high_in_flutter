import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/styles.dart';
import 'package:high_in_flutter/repository/local_data.dart';
import 'package:high_in_flutter/views/table_of_contents/table_of_contents.dart';
import 'package:provider/provider.dart';

import 'views/dark_mode_implementation/dark_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await LocalRepositoryManager.initializeSharedPreferences();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(
    ChangeNotifierProvider(
      create: (_) => DarkModeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<DarkModeProvider>(context);
    _provider.getDarkTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(_provider.darkTheme, context),
      home: const TableOfContent(),
    );
  }
}
