import 'package:flutter/material.dart';
import 'package:live_music/Screens/Songlist/albums.dart';
import 'package:live_music/Screens/home.dart';

class Globals {
  static String Logo = "assets/images/Live Music Bar Logo.gif";
  static String Logoicon = "assets/images/icon.jpg";
  static String font1 = "local";
  static String font2 = "style";
  static Color button = Color(0xfff7943d);
  static bool ison = true;
  static int slidervalue = 0;
  static int index = 0;

  static List <Map<String,dynamic>> comm = [
    {
      'image' : 'assets/images/1.jpeg',
      'song' : 'assets/audios/Wishlist.mp3',
      'artist' : 'Dino James',
      'massage' : 'This is my play list',
      'songname' : 'Wishlist',
    },
    {
      'image' : 'assets/images/2.jpg',
      'song' : 'assets/audios/Ping_pong_hardwell_remix.mp3',
      'artist' : 'King',
      'massage' : 'This is my play list',
      'songname' : 'Ping_pong_haedwell_remix',
    },
    {
      'image' : 'assets/images/3.jpg',
      'song' : 'assets/audios/WOH.mp3',
      'artist' : 'Ikka',
      'massage' : 'This is my play list',
      'songname' : 'W O H',
    },
    {
      'image' : 'assets/images/4.jpg',
      'song' : 'assets/audios/Thunder.mp3',
      'artist' : 'Imagine Dragond',
      'massage' : 'This is my play list',
      'songname' : 'Thunder',
    },
    {
      'image' : 'assets/images/5.jpg',
      'song' : 'assets/audios/Bad_Boys_Lyrics.mp3',
      'artist' : 'Alan Walker',
      'massage' : 'This is my play list',
      'songname' : 'Bad_Boys_Lyrics',
    },
    {
      'image' : 'assets/images/6.jpg',
      'song' : 'assets/audios/Dance_Monkey.mp3',
      'artist' : 'Tones And I',
      'massage' : 'This is my play list',
      'songname' : 'Dance_Monkey',
    },
    {
      'image' : 'assets/images/7.jpg',
      'song' : 'assets/audios/295_Sidhu_Moose_Wala.mp3',
      'artist' : 'Sidhu Moosewala',
      'massage' : 'This is my play list',
      'songname' : '295',
    },
    {
      'image' : 'assets/images/8.jpg',
      'song' : 'assets/audios/Unstoppable - Sia.m4a',
      'artist' : 'Dino Jems',
      'massage' : 'This is my play list',
      'songname' : 'Unstoppable',
    },
    {
      'image' : 'assets/images/9.jpg',
      'song' : 'assets/audios/Hello_Garry Sandhu.m4a',
      'artist' : 'Raftar',
      'massage' : 'This is my play list',
      'songname' : 'Hello Garry',
    },
    {
      'image' : 'assets/images/10.jpg',
      'song' : 'assets/audios/Ping_Pong_Mammoth.mp3',
      'artist' : 'Mammoth',
      'massage' : 'This is my play list',
      'songname' : 'Ping pong',
    },
    {
      'image' : 'assets/images/11.jpg',
      'song' : 'assets/audios/Ni_Main_Daku.mp3',
      'artist' : 'Sidu Moosewall',
      'massage' : 'This is my play list',
      'songname' : 'Ni Main Daku',
    },
    {
      'image' : 'assets/images/12.jpg',
      'song' : 'assets/audios/Don_Omar.mp3',
      'artist' : 'MC',
      'massage' : 'This is my play list',
      'songname' : 'Don omar',
    },
    {
      'image' : 'assets/images/13.jpg',
      'song' : 'assets/audios/Move_Raftaar.mp3',
      'artist' : 'Raftaar',
      'massage' : 'This is my play list',
      'songname' : 'Move',
    },
    {
      'image' : 'assets/images/14.jpg',
      'song' : 'assets/audios/Stereo_Hearts.mp3',
      'artist' : 'Stereo',
      'massage' : 'This is my play list',
      'songname' : 'Stereo Hearts',
    },
    {
      'image' : 'assets/images/15.jpg',
      'song' : 'assets/audios/DEVIl.mp3',
      'artist' : 'Sidu Moosewall',
      'massage' : 'This is my play list',
      'songname' : 'DEVIL',
    },
  ];

  static List <Map<String,dynamic>> album = [
    {
      'image' : 'assets/images/15.jpg',
      'song' : 'assets/audios/Wishlist.mp3',
      'artist' : 'Dino James',
      'massage' : 'This is my play list',
      'songname' : 'Wishlist',
    },
    {
      'image' : 'assets/images/14.jpg',
      'song' : 'assets/audios/Ping_pong_hardwell_remix.mp3',
      'artist' : 'King',
      'massage' : 'This is my play list',
      'songname' : 'Ping_pong_haedwell_remix',
    },
    {
      'image' : 'assets/images/13.jpg',
      'song' : 'assets/audios/WOH.mp3',
      'artist' : 'Ikka',
      'massage' : 'This is my play list',
      'songname' : 'W O H',
    },
    {
      'image' : 'assets/images/12.jpg',
      'song' : 'assets/audios/Thunder.mp3',
      'artist' : 'Imagine Dragond',
      'massage' : 'This is my play list',
      'songname' : 'Thunder',
    },
    {
      'image' : 'assets/images/11.jpg',
      'song' : 'assets/audios/Bad_Boys_Lyrics.mp3',
      'artist' : 'Alan Walker',
      'massage' : 'This is my play list',
      'songname' : 'Bad_Boys_Lyrics',
    },
    {
      'image' : 'assets/images/10.jpg',
      'song' : 'assets/audios/Dance_Monkey.mp3',
      'artist' : 'Tones And I',
      'massage' : 'This is my play list',
      'songname' : 'Dance_Monkey',
    },
    {
      'image' : 'assets/images/9.jpg',
      'song' : 'assets/audios/295_Sidhu_Moose_Wala.mp3',
      'artist' : 'Sidhu Moosewala',
      'massage' : 'This is my play list',
      'songname' : '295',
    },
    {
      'image' : 'assets/images/8.jpg',
      'song' : 'assets/audios/Unstoppable - Sia.m4a',
      'artist' : 'Dino Jems',
      'massage' : 'This is my play list',
      'songname' : 'Unstoppable',
    },
    {
      'image' : 'assets/images/7.jpg',
      'song' : 'assets/audios/Hello_Garry Sandhu.m4a',
      'artist' : 'Raftar',
      'massage' : 'This is my play list',
      'songname' : 'Hello Garry',
    },
    {
      'image' : 'assets/images/6.jpg',
      'song' : 'assets/audios/Ping_Pong_Mammoth.mp3',
      'artist' : 'Mammoth',
      'massage' : 'This is my play list',
      'songname' : 'Ping pong',
    },
    {
      'image' : 'assets/images/5.jpg',
      'song' : 'assets/audios/Ni_Main_Daku.mp3',
      'artist' : 'Sidu Moosewall',
      'massage' : 'This is my play list',
      'songname' : 'Ni Main Daku',
    },
    {
      'image' : 'assets/images/4.jpg',
      'song' : 'assets/audios/Don_Omar.mp3',
      'artist' : 'MC',
      'massage' : 'This is my play list',
      'songname' : 'Don omar',
    },
    {
      'image' : 'assets/images/3.jpg',
      'song' : 'assets/audios/Move_Raftaar.mp3',
      'artist' : 'Raftaar',
      'massage' : 'This is my play list',
      'songname' : 'Move',
    },
    {
      'image' : 'assets/images/2.jpg',
      'song' : 'assets/audios/Stereo_Hearts.mp3',
      'artist' : 'Stereo',
      'massage' : 'This is my play list',
      'songname' : 'Stereo Hearts',
    },
    {
      'image' : 'assets/images/1.jpeg',
      'song' : 'assets/audios/DEVIl.mp3',
      'artist' : 'Sidu Moosewall',
      'massage' : 'This is my play list',
      'songname' : 'DEVIL',
    },
  ];

  static List tab_list = [const Home(), const Albums()];
}
