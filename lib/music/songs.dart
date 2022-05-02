// ignore_for_file: prefer_const_constructors
class PlayList {
  final String artist;
  final String song;
  final String color;
  final String image;

  PlayList(
      {required this.artist,
      required this.song,
      required this.color,
      required this.image});
}

final songs = [
  PlayList(
      artist: "Udit Narayan",
      song: "Pehla Nasha",
      color: "#630f10",
      image:
          "https://i0.wp.com/99lyricstore.com/wp-content/uploads/2021/04/Pehla2BNasha2BLyrics2BUdit2BNarayan2Band2BSadhana2BSargam.jpg?w=840&ssl=1")
];
