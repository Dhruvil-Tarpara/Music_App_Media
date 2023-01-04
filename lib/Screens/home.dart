import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_music/Globals/global.dart';
import 'package:live_music/Screens/Songlist/albums.dart';
import 'package:live_music/Screens/Songlist/commercial.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        leading: Image(
          image: AssetImage(Globals.Logoicon),
          fit: BoxFit.cover,
          width: size.width * 0.1,
          height: size.height * 0.1,
        ),
        backgroundColor: Colors.black,
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              CupertinoIcons.search,
              color: CupertinoColors.extraLightBackgroundGray,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.person,
              color: CupertinoColors.extraLightBackgroundGray,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        padding: const EdgeInsetsDirectional.all(8),
      ),
      backgroundColor: Colors.black,
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Find the best music for your banger",
                        style: TextStyle(
                          fontFamily: Globals.font1,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: CupertinoColors.extraLightBackgroundGray,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      child: const CupertinoSearchTextField(
                        padding: EdgeInsetsDirectional.all(12),
                        style: TextStyle(
                            color: CupertinoColors.lightBackgroundGray),
                        autocorrect: true,
                        itemColor: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(26),
                            right: Radius.circular(26)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemFill,
                          borderRadius: BorderRadius.circular(26)),
                      child: CupertinoSlidingSegmentedControl<int>(
                        backgroundColor: CupertinoColors.darkBackgroundGray,
                        thumbColor: Globals.button,
                        padding: EdgeInsets.all(8),
                        groupValue: Globals.slidervalue,
                        children: {
                          0: Text(
                            "Commercial",
                            style: TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.extraLightBackgroundGray,
                              fontFamily: Globals.font1,
                            ),
                          ),
                          1: Text(
                            "Albums",
                            style: TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.extraLightBackgroundGray,
                              fontFamily: Globals.font1,
                            ),
                          ),
                        },
                        onValueChanged: (value) {
                          setState(() {
                            Globals.slidervalue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 3, child:(Globals.slidervalue == 0 ) ? Commercial() : Albums(),),
          ],
        ),
      ),
    );
  }
}
