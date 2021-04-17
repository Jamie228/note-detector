import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/realtime/bounding_box.dart';
import 'package:object_detection/realtime/camera.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  final int method;
  LiveFeed(this.cameras, this.method);
  @override
  _LiveFeedState createState() => _LiveFeedState(method);
}

class _LiveFeedState extends State<LiveFeed> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String noteNameModelPath = "assets/models/nn.tflite";
  String noteNameLabelPath = "assets/models/label_nn.txt";
  String noteModelPath = "assets/models/notes.tflite";
  String noteLabelPath = "assets/models/labels.txt";

  final int method;
  _LiveFeedState(this.method);

  initCameras() async {}

  loadTfModel() async {
    String modelPath;
    String labelPath;

    if (method == 1) {
      modelPath = noteModelPath;
      labelPath = noteLabelPath;
    } else if (method == 2) {
      modelPath = noteNameModelPath;
      labelPath = noteNameLabelPath;
    }

    await Tflite.loadModel(
      model: modelPath,
      labels: labelPath,
    );
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Note Detection"),
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
    );
  }
}
