// ignore_for_file: prefer_const_constructors
class PlayList {
  static List<Lists> songs = [
    Lists(
        artist: "Udit Narayan",
        song: "Pehla Nasha",
        color: "#630f10",
        image:
            "https://i0.wp.com/99lyricstore.com/wp-content/uploads/2021/04/Pehla2BNasha2BLyrics2BUdit2BNarayan2Band2BSadhana2BSargam.jpg?w=840&ssl=1")
  ];
}

class Lists {
  final String artist;
  final String song;
  final String color;
  final String image;

  Lists(
      {required this.artist,
      required this.song,
      required this.color,
      required this.image});

  factory Lists.fromMap(Map<String, dynamic> map) {
    return Lists(
      artist: map['artist'],
      song: map['song'],
      color: map['color'],
      image: map['image'],
    );
  }
  toMap() => {
        "artist": artist,
        "song": song,
        "color": color,
        "image": image,
      };
}
