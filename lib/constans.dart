const description =
    'Your favorite tracks of the year - all in one playlist, updated weekly.';

class Song {
  String img, rating, song, singer;
  double stars;
  Song(this.img, this.rating, this.song, this.singer, [this.stars = 0.0]);
}

var songsData = <Song>[
  Song('assets/Stay.png', '1', 'Stay', 'The Kid Laroi, Justin Bieber', 0.0),
  Song('assets/INDUSTRY_BABY.png', '2', 'INDUSTRY BABY',
      'Lil Nas X, Jack Harlow', 0.0),
];
