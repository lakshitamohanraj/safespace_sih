import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:censusdemo/src/features/core/screens/live_monitoring/websocket.dart';

import 'details.dart';

class VideoStream extends StatefulWidget {
  const VideoStream({Key? key}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  final WebSocket _socket = WebSocket("ws://10.1.16.185:5000");
  bool _isConnected = false;

  final _data = [
    {'time': '10:00 AM', 'location': 'Living Room', 'violence_detected': false},
    // Add more data entries as needed
  ];

  void connect(BuildContext context) async {
    _socket.connect();
    setState(() {
      _isConnected = true;
    });
  }

  void disconnect() {
    _socket.disconnect();
    setState(() {
      _isConnected = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Video"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => connect(context),

                    child: const Text("Connect"),
                  ),
                  ElevatedButton(
                    onPressed: disconnect,

                    child: const Text("Disconnect"),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              _isConnected
                  ? StreamBuilder(
                stream: _socket.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Center(
                      child: Text("Connection Closed !"),
                    );
                  }
                  //? Working for single frames
                  return Image.memory(
                    Uint8List.fromList(
                      base64Decode(
                        (snapshot.data.toString()),
                      ),
                    ),
                    gaplessPlayback: true,
                    excludeFromSemantics: true,
                  );
                },
              )
                  : const Text("Initiate Connection"),
              DetailsOfMonitoring(),

            ],
          ),
        ),
      ),
    );
  }

}