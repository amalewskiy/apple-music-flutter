import 'package:apple_music/about_song.dart';
import 'package:apple_music/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppleMusic extends StatefulWidget {
  const AppleMusic({Key? key}) : super(key: key);

  @override
  _AppleMusicState createState() => _AppleMusicState();
}

class _AppleMusicState extends State<AppleMusic> {
  double _albumRating = 0.0;

  @override
  void initState() {
    super.initState();
    _getAlbumRating();
    _getSongsRating();
  }

  _getAlbumRating() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _albumRating = prefs.getDouble('albumRating') ?? 0.0;
    });
  }

  _getSongsRating() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < songsData.length; i++) {
      songsData[i].stars = prefs.getDouble(i.toString()) ?? 0.0;
    }
  }

  _setAlbumRating(double album) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('albumRating', album);
  }

  Widget _playlistTitle() {
    return Container(
        width: double.infinity,
        height: 150.0,
        child: Row(
          children: [
            Container(
              width: 150.0,
              height: double.infinity,
              child: FittedBox(
                child: Image.asset('assets/replay2020.png'),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Replay 2020',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Apple music for Federico'),
                      )),
                  Expanded(
                    flex: 8,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: RatingBar.builder(
                          initialRating: _albumRating,
                          itemSize: 35,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            _setAlbumRating(rating);
                          },
                        )),
                  )
                ],
              ),
            ))
          ],
        ));
  }

  Widget _playlistDescription() {
    return Container(
      height: 60.0,
      width: double.infinity,
      child: Text(description),
    );
  }

  Widget _playlistItem(
      String photo, String rating, String song, String singer) {
    return Container(
      width: double.infinity,
      height: 66.0,
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(photo), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(4.0)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 30.0,
              height: 50.0,
              alignment: Alignment.center,
              child: Text(
                rating,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                height: 25.0,
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                child:
                    Text(song, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 25.0,
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Text(singer),
              ),
              Divider(color: Color(0xFFC2CAD7)),
            ],
          )),
        ],
      ),
    );
  }

  Widget _playlist() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: songsData.length,
        itemBuilder: (context, i) {
          return GestureDetector(
              onTap: () {
                _getSongsRating();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutSong(
                            song: songsData[i].song,
                            singer: songsData[i].singer,
                            stars: songsData[i].stars,
                            index: i)));
              },
              child: _playlistItem(songsData[i].img, songsData[i].rating,
                  songsData[i].song, songsData[i].singer));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Row(children: [
          Icon(Icons.arrow_back_ios_new, color: Color(0xFFF94C57)),
          Text('Library',
              overflow: TextOverflow.clip,
              style: TextStyle(color: Color(0xFFF94C57), fontSize: 17))
        ])),
        leadingWidth: 90,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              _playlistTitle(),
              Divider(color: Color(0xFFC2CAD7)),
              SizedBox(height: 20.0),
              _playlistDescription(),
              Divider(color: Color(0xFFC2CAD7)),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
              _playlist(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_albums_fill), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'For You'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_note_2), label: 'Browse'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.dot_radiowaves_left_right),
              label: 'Radio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
