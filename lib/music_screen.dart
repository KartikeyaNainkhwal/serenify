import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentTrack;

  final List<Map<String, String>> _musicFiles = [
    {'title': 'Zen Cascade', 'path': 'assets/zen-cascade-meditation-spa-relaxation-music-252902.mp3'},
    {'title': 'Relaxing Piano', 'path': 'assets/relaxing-piano-music-248868.mp3'},
    {'title': 'Calm Night', 'path': 'assets/calm-night-piano-music-249235.mp3'},
    {'title': 'Inspirational Uplifting', 'path': 'assets/inspirational-uplifting-calm-piano-254764.mp3'},
    {'title': 'Carol of the Bells', 'path': 'assets/carol-of-the-bells-background-christmas-music-for-video-bells-ver-254194.mp3'},
    {'title': 'Deck the Halls', 'path': 'assets/deck-the-halls-background-christmas-music-for-video-38-second-253223.mp3'},
    {'title': 'Lofi Study Chill', 'path': 'assets/lofi-study-calm-peaceful-chill-hop-112191.mp3'},
    {'title': 'Calm Soul', 'path': 'assets/calm-soul-meditation-247330.mp3'},
    {'title': 'Peace of Mind', 'path': 'assets/peace-of-mind-254203.mp3'},
    {'title': 'Weeknds', 'path': 'assets/weeknds-122592.mp3'},
    {'title': 'Where\'s My Love', 'path': 'assets/wherex27s-my-love-soft-piano-music-248975.mp3'},
  ];

  Future<void> _playMusic(String path) async {
    // try {
      if (_currentTrack == path) {
        // Pause if the same track is clicked again
        await _audioPlayer.pause();
        setState(() => _currentTrack = null);
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(path));
        setState(() => _currentTrack = path);
      }
    // } catch (error) {
    //   // If an error occurs, display a simple error message
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Could not play the track. Please check the asset path.')),
    //   );
    // }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7EBAF8),
        title: Text('Music'),
      ),
      body: ListView.builder(
        itemCount: _musicFiles.length,
        itemBuilder: (context, index) {
          final track = _musicFiles[index];
          final isPlaying = _currentTrack == track['path'];
          return ListTile(
            title: Text(track['title']!),
            trailing: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onTap: () => _playMusic(track['path']!),
          );
        },
      ),
    );
  }
}
