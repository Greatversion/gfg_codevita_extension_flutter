// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:gfg_collab/signaling.dart';

class CollabScreenRtc extends StatefulWidget {
  const CollabScreenRtc({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CollabScreenRtcState createState() => _CollabScreenRtcState();
}

class _CollabScreenRtcState extends State<CollabScreenRtc> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    signaling.openUserMedia(_localRenderer, _remoteRenderer);
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebRTC"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  roomId = await signaling.createRoom(_remoteRenderer);
                  textEditingController.text = roomId!;
                  setState(() {});
                },
                child: const Text("Create room"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add roomId
                  signaling.joinRoom(
                    textEditingController.text.trim(),
                    _remoteRenderer,
                  );
                },
                child: const Text("Join room"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  signaling.hangUp(_localRenderer);
                },
                child: const Text("Hangup"),
              )
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: SizedBox(
                        width: 250, // Adjust the size as needed
                        height: 250,
                        child: RTCVideoView(_localRenderer)),
                  ),
                  ClipOval(
                    // ignore: unnecessary_null_comparison
                    child: SizedBox(
                      width: 250, // Adjust the size as needed
                      height: 250, // Adjust the size as needed
                      child: RTCVideoView(
                          _remoteRenderer), // Your video player widget
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
