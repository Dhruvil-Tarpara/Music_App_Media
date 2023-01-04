import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_music/Globals/service.dart';

import '../../Globals/global.dart';

class Commercial extends StatefulWidget {
  const Commercial({Key? key}) : super(key: key);

  @override
  State<Commercial> createState() => _CommercialState();
}

class _CommercialState extends State<Commercial> {
  Services service = Get.find<Services>();

  late int i = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    play(Globals.index);
  }

  play(int index) {
    service.musicplayer(
      music: Globals.comm[index]['song'],
      art: Globals.comm[index]['artist'],
      titel: Globals.comm[index]['songname'],
      album: Globals.comm[index]['massage'],
      image: Globals.comm[index]['image'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    service.myplay.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 12,
      ),
      itemCount: Globals.comm.length,
      itemBuilder: (context, index) {
        return CircleAvatar(
          backgroundImage: AssetImage(Globals.comm[index]['image']),
          child: GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                barrierDismissible: false,
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: [
                    Container(
                      color: CupertinoColors.tertiaryLabel,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onDoubleTap: () {
                              Get.toNamed('Play_Screen',
                                  arguments: service.myplay);
                              setState(() {
                                Globals.index = index;
                              });
                            },
                            child: CircleAvatar(
                              backgroundImage:
                              AssetImage(Globals.comm[index]['image']),
                              radius: 26,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Globals.comm[index]['songname']}",
                                style: TextStyle(
                                  fontFamily: Globals.font1,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "${Globals.comm[index]['artist']}",
                                style: TextStyle(
                                  fontFamily: Globals.font1,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
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
                            child: const Icon(
                              CupertinoIcons.clear,
                              color: CupertinoColors.destructiveRed,
                            ),
                          ),
                        ],
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
            child: CircleAvatar(
              radius: 70,
              backgroundColor: CupertinoColors.inactiveGray.withOpacity(0.3),
              child: Center(
                child: Text(
                  Globals.comm[index]['artist'],
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: Globals.font2,
                    color: CupertinoColors.systemTeal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}