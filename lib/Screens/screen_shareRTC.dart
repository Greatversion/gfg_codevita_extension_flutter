import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class ScreenSharingWidget extends StatefulWidget {
  @override
  _ScreenSharingWidgetState createState() => _ScreenSharingWidgetState();
}

class _ScreenSharingWidgetState extends State<ScreenSharingWidget> {
  final WebRTCController _controller = WebRTCController();
  MediaStream? _screenStream;
  RTCVideoRenderer? _screenRenderer;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();
    _screenRenderer = RTCVideoRenderer();
    await _screenRenderer!.initialize();
  }

  @override
  void dispose() {
    _screenStream?.dispose();
    _screenRenderer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Sharing '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_screenStream != null && _screenRenderer != null)
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: RTCVideoView(_screenRenderer!),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startScreenSharing,
              child: const Text('Start Screen Sharing'),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _stopScreenSharing,
            //   child: Text('Stop Screen Sharing'),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _startScreenSharing() async {
    _screenStream = await _controller.startScreenSharing();
    if (_screenStream != null && _screenRenderer != null) {
      _screenRenderer!.srcObject = _screenStream!;
      setState(() {});
    }
  }

  // Future<void> _stopScreenSharing() async {
  //   await _controller.stopScreenSharing();
  //   _screenStream?.dispose();
  //   _screenStream = null;
  //   if (_screenRenderer != null) {
  //     _screenRenderer!.srcObject = null;
  //   }
  //   setState(() {});
  // }
}

class WebRTCController {
  RTCPeerConnection? _peerConnection;

  Future<void> initialize() async {
    _peerConnection = await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ]
    }, {});
  }

  Future<MediaStream> startScreenSharing() async {
    MediaStream stream =
        await navigator.mediaDevices.getDisplayMedia({'video': true});
    stream.getTracks().forEach((track) {
      _peerConnection?.addTrack(track, stream);
    });
    return stream;
  }

  // Future<void> stopScreenSharing() async {
  //   _peerConnection?.getSenders().forEach((sender) {
  //     if (sender.track?.kind == 'video') {
  //       _peerConnection?.removeTrack(sender);
  //     }
  //   });
  // }
}
