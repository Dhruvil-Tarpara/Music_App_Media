import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_music/Globals/global.dart';

class Screen_one extends StatefulWidget {
  const Screen_one({Key? key}) : super(key: key);

  @override
  State<Screen_one> createState() => _Screen_oneState();
}

class _Screen_oneState extends State<Screen_one> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    push();
  }

  push()
  async{
   await Future.delayed(Duration(seconds: 4),);
   Get.offNamed('Screen2');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Center(
        child: Image(
          image: AssetImage(Globals.Logo),
        ),
      ),
    );
  }
}
