import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCController {
  RTCPeerConnection? _peerConnection;

  Future<void> initialize() async {
    _peerConnection = await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ]
    }, {});
  }

  Future<void> startScreenSharing() async {
    MediaStream stream = await navigator.mediaDevices.getDisplayMedia({});
    stream.getTracks().forEach((track) {
      _peerConnection?.addTrack(track, stream);
    });
  }

  // Future<void> stopScreenSharing() async {
  //   _peerConnection?.getSenders().forEach((sender) {
  //     if (sender.track?.kind == 'video') {
  //       _peerConnection?.removeTrack(sender);
  //     }
  //   });
  // }
}
