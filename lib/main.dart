import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_music/Screens/playscreen.dart';
import 'package:live_music/Screens/screen1.dart';
import 'package:live_music/Screens/screen2.dart';
import 'Globals/service.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Services service = Get.put(Services());

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      highContrastDarkTheme: ThemeData.dark(),
      home: const Screen_one(),
      routes: {
        'Screen2' : (context) => const Screen_two(),
        'Play_Screen' : (context) => const Play_screen(),
      },
    );
  }
}
