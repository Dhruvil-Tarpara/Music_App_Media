import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_music/Globals/global.dart';
import '../Globals/service.dart';

class Play_screen extends StatefulWidget {
  const Play_screen({Key? key}) : super(key: key);

  @override
  State<Play_screen> createState() => _Play_screenState();
}

class _Play_screenState extends State<Play_screen> {
  Services service = Get.find<Services>();
  double val = 0;

  @override
  Widget build(BuildContext context) {
    dynamic data = Get.arguments;

    int i = Globals.index;
    var size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage(Globals.comm[i]['image']),
                    ),
                  ),
                  Text(
                    Globals.comm[i]['songname'],
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: Globals.font2,
                      letterSpacing: 4,
                      color: CupertinoColors.activeGreen,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Globals.comm[i]['artist'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: Globals.font1,
                          letterSpacing: 2,
                          color: CupertinoColors.lightBackgroundGray,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.bookmark,
                        color: CupertinoColors.lightBackgroundGray,
                        size: 18,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Globals.comm[i]['massage'],
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: Globals.font2,
                          letterSpacing: 3,
                          color: CupertinoColors.activeOrange,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chart_bar_alt_fill,
                        color: CupertinoColors.activeGreen,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: StreamBuilder<Object>(
                stream: service.myplay.currentPosition,
                builder: (context, AsyncSnapshot snapshot) {
                  service.Current = snapshot.data;
                  return CupertinoSlider(
                    activeColor: CupertinoColors.activeOrange,
                    thumbColor: CupertinoColors.activeOrange,
                    min: 0,
                    max: service.Totallenth.inSeconds.toDouble(),
                    value: service.Current.inSeconds.toDouble(),
                    onChanged: (val) {
                      service.myplay.seek(Duration(seconds: val.toInt()));
                      service.Current = Duration(seconds: val.toInt());
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      Globals.index == 0
                          ? Globals.index = 0
                          : Globals.index--;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.backward_end_alt,
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                ),
                StreamBuilder(
                  stream: service.myplay.isPlaying,
                  builder: (context, AsyncSnapshot snapshot) {
                    Globals.ison = snapshot.data;
                    return Card(
                      color: CupertinoColors.inactiveGray,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: CupertinoButton(
                        onPressed: () async {
                          Globals.ison
                              ? service.myplay.pause()
                              : service.myplay.play();
                          setState(() {});
                        },
                        child: Icon(
                          Globals.ison
                              ? CupertinoIcons.pause
                              : CupertinoIcons.play_arrow_solid,
                          color: CupertinoColors.lightBackgroundGray,
                        ),
                      ),
                    );
                  },
                ),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      Globals.index == Globals.comm.length
                          ? Globals.index = 0
                          : Globals.index++;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.forward_end_alt,
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
