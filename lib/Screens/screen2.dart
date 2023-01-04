import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:live_music/Globals/global.dart';
import 'package:live_music/Globals/service.dart';

class Screen_two extends StatefulWidget {
  const Screen_two({Key? key}) : super(key: key);

  @override
  State<Screen_two> createState() => _Screen_twoState();
}

class _Screen_twoState extends State<Screen_two> {
  Services service = Get.find<Services>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.house_alt,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.play_rectangle,
              ),
              label: 'Play List'),
        ],

        backgroundColor: CupertinoColors.darkBackgroundGray,
        activeColor: CupertinoColors.activeOrange,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return Globals.tab_list[index];
          },
        );
      },
      backgroundColor: CupertinoColors.black,
    );
  }
}
