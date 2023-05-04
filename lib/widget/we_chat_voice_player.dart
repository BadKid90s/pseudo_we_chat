import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class WeChatVoicePlayer extends StatefulWidget {
  final String filePath;
  final Duration duration;

  const WeChatVoicePlayer(
      {Key? key, required this.filePath, required this.duration})
      : super(key: key);

  @override
  State<WeChatVoicePlayer> createState() => _WeChatVoicePlayerState();
}

class _WeChatVoicePlayerState extends State<WeChatVoicePlayer> {
  late FlutterSoundPlayer? _player;

  void statPlayer() async {
    await _player?.startPlayer(fromURI: widget.filePath);
    _player?.onProgress?.listen((event) {
      if (event.position == event.duration) {
        // 播放完成
        _player?.closePlayer();
      }
    });
  }

  void _initPlayer() async {
    _player = await FlutterSoundPlayer().openPlayer();
  }

  void _closePlayer() async {
    _player?.closePlayer();
  }

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _closePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.volume_up),
        Text("${widget.duration.inSeconds}‘’ ")
      ],
    );
  }
}
