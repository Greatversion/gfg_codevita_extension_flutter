import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:gfg_collab/signaling.dart';

class CollabView extends StatefulWidget {
  const CollabView({super.key});

  @override
  State<CollabView> createState() => _CollabViewState();
}

class _CollabViewState extends State<CollabView> {
  Signaling signaling =  Signaling();
  // local remote and local renderer....
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    // whenever a new stream happens it add to the RemoteRender..
    // signaling.onAddRemoteStream = ((stream) {
    //   _remoteRenderer.srcObject = stream;
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
   