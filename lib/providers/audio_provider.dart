import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  // Playlists (Paths relative to assets/)
  final List<String> _workPlaylist = [
    "sounds/work_songs/A Sky Full of Stars_spotdown.org.mp3",
    "sounds/work_songs/espresso_spotdown.org.mp3",
    "sounds/work_songs/I'm Good (Blue)_spotdown.org.mp3",
    "sounds/work_songs/Redbone_spotdown.org.mp3",
    "sounds/work_songs/SLOW DANCING IN THE DARK_spotdown.org.mp3",
    "sounds/work_songs/what was i made for__spotdown.org.mp3",
  ];

  final List<String> _chillPlaylist = [
    "sounds/chill_songs/Hotline Bling_spotdown.org.mp3",
    "sounds/chill_songs/i like the way you kiss me_spotdown.org.mp3",
    "sounds/chill_songs/The Less I Know The Better_spotdown.org.mp3",
  ];

  // State Tracking
  int _currentWorkIndex = 0;
  int _currentChillIndex = 0;
  Duration _savedWorkPosition = Duration.zero;
  Duration _savedChillPosition = Duration.zero;

  bool _isPlaying = false;
  bool _isWorkMode = true; // true = work, false = chill
  double _volume = 0.5;

  AudioProvider() {
    // Listen for song completion to play next track
    _player.onPlayerComplete.listen((event) {
      _playNextSong();
    });
  }

  bool get isPlaying => _isPlaying;

  Future<void> setVolume(double volume) async {
    _volume = volume;
    await _player.setVolume(volume);
  }

  // Core Play/Pause/Stop
  Future<void> playMusic(bool isWorkMode, {double? volume}) async {
    if (volume != null) {
      _volume = volume;
    }
    // If switching modes, save state first
    if (_isWorkMode != isWorkMode) {
      await _saveCurrentPosition();
      _isWorkMode = isWorkMode;
    }

    if (_isPlaying) return; // Already playing

    await _resumePlayback();
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> pauseMusic() async {
    if (!_isPlaying) return;
    await _player.pause();
    await _saveCurrentPosition();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> stopMusic() async {
    await _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

  // Internal Logic
  Future<void> _saveCurrentPosition() async {
    final position = await _player.getCurrentPosition();
    if (position != null) {
      if (_isWorkMode) {
        _savedWorkPosition = position;
      } else {
        _savedChillPosition = position;
      }
    }
  }

  Future<void> _resumePlayback() async {
    final playlist = _isWorkMode ? _workPlaylist : _chillPlaylist;
    final index = _isWorkMode ? _currentWorkIndex : _currentChillIndex;
    final startPosition = _isWorkMode
        ? _savedWorkPosition
        : _savedChillPosition;

    // Safety check for empty playlists
    if (playlist.isEmpty) {
      debugPrint(
        "Playlist is empty for mode: ${_isWorkMode ? 'Work' : 'Chill'}",
      );
      return;
    }

    final songPath = playlist[index % playlist.length];

    try {
      // Play with set volume
      await _player.setVolume(_volume);
      await _player.play(AssetSource(songPath), position: startPosition);
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }

  Future<void> _playNextSong() async {
    // Increment index and loop
    if (_isWorkMode) {
      _currentWorkIndex = (_currentWorkIndex + 1) % _workPlaylist.length;
      _savedWorkPosition = Duration.zero; // Reset position for next song
    } else {
      _currentChillIndex = (_currentChillIndex + 1) % _chillPlaylist.length;
      _savedChillPosition = Duration.zero;
    }

    // Play the new track
    await _resumePlayback();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
