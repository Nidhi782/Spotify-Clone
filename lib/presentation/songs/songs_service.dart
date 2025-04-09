import 'package:flutter/material.dart';
import 'package:spotify_2/data/sources/auth/songs_service.dart';
import 'package:audioplayers/audioplayers.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final SongsService _songsService = SongsService();
  List<Map<String, dynamic>> _songs = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    final songs = await _songsService.fetchSongs();
    setState(() {
      _songs = songs;
    });
  }

  void _playSong(String url) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(url));
  }

  void _pauseSong() async {
    await _audioPlayer.pause();
  }

  void _stopSong() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Songs')),
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, index) {
          final song = _songs[index];
          return ListTile(
            leading: Image.network(song['image_url']),
            title: Text(song['title']),
            subtitle: Text(song['artist']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => _playSong(song['audio_url']),
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: _pauseSong,
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: _stopSong,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
