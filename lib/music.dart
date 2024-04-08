import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  int _currentlyPlayingIndex = -1;
  List<bool> _iconClicked = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Album cover and details
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/8/86/Einstein_tongue.jpg',
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Album • 8 songs • 2012'),
                        SizedBox(height: 8.0),
                        const Text(
                          'Charcoal',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Brambles...'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.music_video, color: _iconClicked[0] ? Colors.black : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _iconClicked = [true, false, false, false];
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.downloading, color: _iconClicked[1] ? Colors.black : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _iconClicked = [false, true, false, false];
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz, color: _iconClicked[2] ? Colors.black : Colors.grey), // Change to horizontal dots icon
                              onPressed: () {
                                setState(() {
                                  _iconClicked = [false, false, true, false];
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Music controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton.icon(
                    icon: Icon(Icons.play_arrow, color: Colors.white),
                    label: Text('Play', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.shuffle, color: Colors.white),
                    label: Text('Shuffle', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                  ),
                ],
              ),
              // Song list
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final int songNumber = index + 1;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          leading: _currentlyPlayingIndex == index
                              ? Icon(Icons.waves)
                              : Text(
                            '${songNumber.toString().padLeft(2, '0')}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            _getSongTitle(songNumber),
                          ),
                          subtitle: Text('Brambles   4:21', style: TextStyle(color: Colors.grey, fontSize: 12.0)), // Replace with song artist and duration
                          trailing: Icon(Icons.more_horiz),
                          onTap: () {
                            setState(() {
                              _currentlyPlayingIndex = index;
                            });
                            _showBanner(context, _getSongTitle(songNumber));
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _currentlyPlayingIndex != -1 ? _buildBanner(_getSongTitle(_currentlyPlayingIndex + 1)) : SizedBox(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Hotlist',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }

  String _getSongTitle(int songNumber) {
    switch (songNumber) {
      case 1:
        return 'To Speak Of Solitude';
      case 2:
        return 'Unsayable';
      case 3:
        return 'In The Androgynous Dark';
      case 4:
        return 'Salt Photographs';
      case 5:
        return 'Pink And Golden Billows';
      default:
        return '';
    }
  }

  void _showBanner(BuildContext context, String songTitle) {
 }

  Widget _buildBanner(String songTitle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/en/8/86/Einstein_tongue.jpg',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  Text(
                    'Brambles',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
