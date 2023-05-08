import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';

class WeChatVoiceInputController {
  ValueNotifier<bool> showRecord = ValueNotifier(false);

  late String _path;

  late Duration _duration;

  bool get isRecording => showRecord.value;

  String get path => _path;

  Duration get duration => _duration;

  // 录音机
  late FlutterSoundRecorder? _recorder;

  // 录音文件存储位置
  late String _recordFilePath;

  // 录音时间
  Duration _listenDuration = const Duration(milliseconds: 0);

  ///获取存储路径
  Future<String> _getRecordingPath() async {
    final now = DateTime.now();
    return 'recording_${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}.aac';
  }

  ///开始录音
  void startRecording() async {
    debugPrint("startRecording ............");
    _showOverlay();
    var recordingPath = await _getRecordingPath();
    _recordFilePath = recordingPath;

    _recorder?.startRecorder(toFile: _recordFilePath);
    _recorder?.setSubscriptionDuration(const Duration(milliseconds: 100));
    _recorder?.onProgress?.listen((event) {
      _listenDuration = event.duration;
    });
  }

  ///停止录音
  void stopRecording() async {
    debugPrint("stopRecording ............");
    _hideOverlay();

    _recorder?.stopRecorder();

    _path = _recordFilePath;
    _duration = _listenDuration;
    _resetDuration();
  }

  ///初始化录音机
  Future<void> _initRecorder() async {
    _recorder = await FlutterSoundRecorder().openRecorder();
  }

  ///关闭录音机
  Future<void> _closeRecorder() async {
    await _recorder?.closeRecorder();
  }

  Future<void> _resetDuration() async {
    _listenDuration = const Duration(milliseconds: 0);
  }

  void init(Function function) async {
    await _initRecorder();
    await _resetDuration();
    _recorder?.setSubscriptionDuration(const Duration(milliseconds: 100));
    _recorder?.onProgress?.listen((event) {
      function(event);
    });
  }

  void _showOverlay() {
    showRecord.value = true;
  }

  void _hideOverlay() {
    showRecord.value = false;
  }

  void _dispose() {
    showRecord.dispose();
  }
}

class WeChatVoiceInput extends StatefulWidget {
  final WeChatVoiceInputController controller;
  final Widget? child;

  const WeChatVoiceInput({Key? key, required this.controller, this.child})
      : super(key: key);

  @override
  State<WeChatVoiceInput> createState() => _WeChatVoiceInputState();
}

class _WeChatVoiceInputState extends State<WeChatVoiceInput> {
   Duration _listenDuration = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();

    widget.controller.init((event) {
      setState(() {
        _listenDuration = event.duration;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller._dispose();
    widget.controller._closeRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller.showRecord,
        builder: (BuildContext context, bool showOverlay, Widget? element) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                if (showOverlay)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.mic),
                          Text(
                              "${_listenDuration.inMinutes}:${(_listenDuration.inSeconds % 60).toString().padLeft(2, '0')} "),
                        ],
                      ),
                    ),
                  ),
                if (widget.child != null) widget.child!
              ],
            ),
          );
        });
  }
}
