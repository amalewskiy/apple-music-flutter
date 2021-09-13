import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutSong extends StatefulWidget {
  final song, singer, stars, index;
  const AboutSong(
      {Key? key,
      required this.song,
      required this.singer,
      required this.stars,
      required this.index})
      : super(key: key);

  @override
  _AboutSongState createState() => _AboutSongState();
}

class _AboutSongState extends State<AboutSong> {
  late final _song, _singer, _stars, _index;
  @override
  void initState() {
    super.initState();
    _song = widget.song;
    _singer = widget.singer;
    _stars = widget.stars;
    _index = widget.index;
  }

  _setSongRating(double newRating) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_index.toString(), newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.red])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_song,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              _singer,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: _stars,
              itemSize: 35,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                _setSongRating(rating);
              },
            )
          ],
        ),
      ),
    );
  }
}
