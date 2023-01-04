import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:live_music/Globals/global.dart';

class Services extends GetxController {
  final AssetsAudioPlayer myplay = AssetsAudioPlayer();
   Duration Totallenth = Duration.zero;
   Duration Current = Duration.zero;

  bool swich = true;

  bool isPlaying = true;

  on() {
    swich = !swich;
    update();
  }

  musicplayer({
    required String music,
    required String art,
    required String titel,
    required String album,
    required String image,
  }) async =>
      await myplay.open(
        Audio(
          music,
          metas: Metas(
            artist: art,
            title: titel,
            album: album,
            image: MetasImage.asset(image),
          ),
        ),
        autoStart: false,
        showNotification: true,
      ).then((value) => {
        myplay.current.listen((event) {
            Totallenth = myplay.current.value!.audio.duration;
        })
      });
}
