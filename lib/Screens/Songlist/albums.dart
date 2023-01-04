import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_music/Globals/global.dart';
import 'package:live_music/Globals/service.dart';

class Albums extends StatefulWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  Services service = Get.find<Services>();

  late int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play(1);
  }

  play(int index) {
    service.musicplayer(
      music: Globals.album[index]['song'],
      art: Globals.album[index]['artist'],
      titel: Globals.album[index]['songname'],
      album: Globals.album[index]['massage'],
      image: Globals.album[index]['image'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    service.myplay.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Globals.album.length,
      itemBuilder: (context,index) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(Globals.album[index]['image']),
                  child: GestureDetector(
                    onTap: () {
                    //  Get.toNamed('Play_Screen');
                      showCupertinoModalPopup(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [
                            GestureDetector(
                              onDoubleTap: () {
                                Get.toNamed('Play_Screen',
                                    arguments: service.myplay);
                                setState(() {
                                  Globals.index = index;
                                });
                              },
                              child: Container(
                                color: CupertinoColors.tertiaryLabel,
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                      AssetImage(Globals.album[index]['image']),
                                      radius: 26,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${Globals.album[index]['songname']}",
                                          style: TextStyle(
                                            fontFamily: Globals.font1,
                                            fontSize: 11,
                                          ),
                                        ),
                                        Text(
                                          "${Globals.album[index]['artist']}",
                                          style: TextStyle(
                                            fontFamily: Globals.font1,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    StreamBuilder(
                                      stream: service.myplay.isPlaying,
                                      builder: (context, AsyncSnapshot snapshot) {
                                        Globals.ison = snapshot.data;
                                        return CupertinoButton( onPressed: () async {
                                          Globals.ison ?service.myplay.pause() :service.myplay.play(); setState((){});},
                                          child: Icon(Globals.ison ?CupertinoIcons.pause:
                                          CupertinoIcons.play_arrow_solid,
                                            color: CupertinoColors.lightBackgroundGray,),
                                        );
                                      },
                                    ),
                                    CupertinoButton(
                                      onPressed: () {
                                        return Get.back();
                                      },
                                      child: Icon(
                                        CupertinoIcons.clear,
                                        color: CupertinoColors.destructiveRed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      setState(
                            () {
                          play(Globals.index);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Globals.album[index]['songname'],
                      style: TextStyle(
                        color: CupertinoColors.lightBackgroundGray,
                        fontFamily: Globals.font1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      Globals.album[index]['artist'],
                      style: TextStyle(
                        color: CupertinoColors.lightBackgroundGray,
                        fontFamily: Globals.font1,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CupertinoButton(
                  onPressed: () {
                    Get.toNamed('Play_Screen',
                        arguments: service.myplay);
                    setState(() {
                      Globals.index = index;
                    });
                  },
                  child: Icon(
                    CupertinoIcons.arrow_right_circle,
                    color: CupertinoColors.lightBackgroundGray,
                    size: 22,
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}