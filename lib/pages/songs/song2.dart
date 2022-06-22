// ignore_for_file: prefer_const_constructors
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/routes.dart';

class SongTwo extends StatefulWidget {
  final musicData;
  final int index;
  const SongTwo({Key? key, this.musicData, required this.index})
      : super(key: key);

  @override
  State<SongTwo> createState() => _SongTwoState();
}

class _SongTwoState extends State<SongTwo> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool playing = false;
  bool repeat = false; // at the begining we ain't playing any song
  IconData playBtn = Icons
      .play_arrow_rounded; //the main state of play button icon // AudioCache
  // AudioPlayer
  Duration position = Duration();
  Duration musicLength = Duration();
  Color color = Colors.white;
  //creating our custom slider

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.white,
        inactiveColor: Colors.grey[350],
        value: position.inSeconds.toDouble(),
        min: 0.0,
        max: musicLength.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSec(value.toInt());
            value = value;
          });
        });
  }

  //creating seek function to freely move the slider or control the time of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    assetsAudioPlayer.seek(newPos);
  }

  //initializing the player
  @override
  void initState() {
    super.initState();
    //convert ByteData to Uint8List
    //now handeling the audio player time
    //this will help to get the muusic duration
    PlayerBuilder.currentPosition(
        player: assetsAudioPlayer,
        builder: (context, duration) {
          return Text(duration.toString());
        });
    //this function will allow us to move the slider accordingly
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double _currentSliderValue = 20;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 28, 166, 113),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 355,
                    ),
                    height: 15,
                    width: 15,
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        assetsAudioPlayer.stop();
                        Navigator.pushNamed(context, MyRoutes.navRoute);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    color: Colors.transparent,
                    child: Text(
                      "From Playlist",
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(1)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Image(
                          image: NetworkImage(this
                              .widget
                              .musicData[this.widget.index]["image"]),
                          width: MediaQuery.of(context).size.width - 120,
                          height: MediaQuery.of(context).size.width - 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                this.widget.musicData[this.widget.index]
                                    ["song"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                this.widget.musicData[this.widget.index]
                                    ["singer"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: 500.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        slider(),
                                        Text(
                                          "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          iconSize: 32.0,
                                          color: color,
                                          onPressed: (() {}),
                                          icon: Icon(Icons.loop_sharp)),
                                      IconButton(
                                        iconSize: 45.0,
                                        color: Colors.white,
                                        onPressed: (() {
                                          Navigator.pushNamed(
                                              context, MyRoutes.songRoute);
                                          if (playing) {
                                            assetsAudioPlayer.stop();
                                            setState(() {
                                              playing = false;
                                            });
                                          }
                                        }),
                                        icon: Icon(
                                          Icons.skip_previous_rounded,
                                        ),
                                      ),
                                      IconButton(
                                        iconSize: 52.0,
                                        color: Colors.white,
                                        onPressed: (() async {
                                          if (!playing) {
                                            await assetsAudioPlayer
                                                .open(Playlist(audios: [
                                              Audio.network(
                                                  "https://pagalfree.com/musics/128-Lag%20Ja%20Gale%20Se%20Phir%20-%20Woh%20Kaun%20Thi%20%20(1964)%20128%20Kbps.mp3"),
                                              Audio.network(
                                                  "https://pwdown.com/111692/03.%20Yeh%20Shaam%20Mastani.mp3")
                                            ]));
                                            assetsAudioPlayer.next();
                                            assetsAudioPlayer.previous();
                                            assetsAudioPlayer
                                                .playlistPlayAtIndex(0);
                                          } else {
                                            await assetsAudioPlayer.pause();
                                            setState(() {
                                              playBtn =
                                                  Icons.play_arrow_rounded;
                                              playing = false;
                                            });
                                          }
                                        }),
                                        icon: Icon(playBtn),
                                      ),
                                      IconButton(
                                        iconSize: 45.0,
                                        color: Colors.white,
                                        onPressed: (() {}),
                                        icon: Icon(
                                          Icons.skip_next_rounded,
                                        ),
                                      ),
                                      IconButton(
                                          iconSize: 30.0,
                                          color: Colors.white,
                                          onPressed: (() {}),
                                          icon: Icon(Icons.repeat_rounded))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
