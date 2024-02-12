import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "8a497406b59149eeb46eb26c4e1c5600";
const token =
    "007eJxTYNgctjXP/oKsjefZP8s/Fcr+rE9Z/7/k2qM5lpfF0gVvbVFXYLBINLE0NzEwSzK1NDSxTE1NMjFLTTIySzZJNUw2NTMw2Kx2NLUhkJHh8pQ9zIwMEAjiszCkJBaVMDAAAOK+IZQ=";
const channel = "dart";

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late final RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    _initAgoraRtcEngine();
    _joinChannel();
    _startScreenSharing();
  }

  void _initAgoraRtcEngine() async {
     await [Permission.camera, Permission.microphone].request();
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
        autoRegisterAgoraExtensions: true,
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileCommunication));
    await _engine.enableVideo();
    await _engine.startPreview();
  }

  void _joinChannel() async {
    await _engine.joinChannel(
        token: token,
        channelId: channel,
        uid: 0,
        options: const ChannelMediaOptions(
            channelProfile: ChannelProfileType.channelProfileCommunication));
  }

  void _startScreenSharing() async {
    await _engine.startScreenCapture(const ScreenCaptureParameters2(
      captureAudio: true,
      captureVideo: true,
    ));
  }

 @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
    // await _engine.destroyCustomVideoTrack(videoTrackId)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call'),
      ),
      body: const Center(
        child: Text('Video call and screen sharing in progress...'),
      ),
    );
  }
}










  // void _startScreenSharing() async {
  //   await _engine.startScreenCapture(const ScreenCaptureParameters2(
  //     captureAudio: true,
  //     captureVideo: true,
  //   ));
  // }