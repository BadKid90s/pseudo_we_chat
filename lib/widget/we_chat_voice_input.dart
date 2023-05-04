import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

typedef VoiceInputCallback = void Function(String path, Duration duration);

class WeChatVoiceInput extends StatefulWidget {
  final VoiceInputCallback callback;

  const WeChatVoiceInput({Key? key, required this.callback}) : super(key: key);

  @override
  State<WeChatVoiceInput> createState() => _WeChatVoiceInputState();
}

class _WeChatVoiceInputState extends State<WeChatVoiceInput> {
  // 录音机
  late FlutterSoundRecorder? _recorder;

  // 录音文件存储位置
  late String _recordFilePath;

  // 录音时间
  late Duration _listenDuration;

  ///获取存储路径
  Future<void> _getRecordingPath() async {
    final now = DateTime.now();
    final recordingPath =
        'recording_${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}.aac';
    _recordFilePath = recordingPath;
  }

  ///开始录音
  void _startRecording() async {
    debugPrint("startRecording ............");
    await _getRecordingPath();
    _recorder?.startRecorder(toFile: _recordFilePath);
    _recorder?.setSubscriptionDuration(const Duration(milliseconds: 100));
    _recorder?.onProgress?.listen((event) {
      setState(() {
        _listenDuration = event.duration;
      });
    });
  }

  ///停止录音
  void _stopRecording() async {
    debugPrint("stopRecording ............");
    _recorder?.stopRecorder();
    widget.callback(_recordFilePath, _listenDuration);
    _resetDuration();
  }

  ///初始化录音机
  void _initRecorder() async {
    _recorder = await FlutterSoundRecorder().openRecorder();
  }

  ///关闭录音机
  void _closeRecorder() async {
    await _recorder?.closeRecorder();
  }

  void _resetDuration() {
    setState(() {
      _listenDuration = const Duration(milliseconds: 0);
    });
  }

  @override
  void initState() {
    super.initState();
    _initRecorder();
    _resetDuration();
  }

  @override
  void dispose() async {
    super.dispose();
    _closeRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        GestureDetector(
          onTapDown: (detail) {
            _startRecording();
          },
          onTapUp: (detail) {
            _stopRecording();
          },
          child: const Icon(Icons.mic),
        ),
        Text(
            "${_listenDuration.inMinutes}:${(_listenDuration.inSeconds % 60).toString().padLeft(2, '0')} "),
      ],
    ));
  }
}
