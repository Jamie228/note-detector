import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:object_detection/realtime/live_camera.dart';
import 'package:object_detection/static%20image/static.dart';
import 'package:path/path.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Detection App"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ButtonTheme(
              //   minWidth: 170,
              //   child: RaisedButton(
              //     child: Text("Detect in Image"),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => StaticImage(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              ButtonTheme(
                minWidth: 170,
                child: RaisedButton(
                  child: Text("Real Time - Note Names"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LiveFeed(cameras, 2)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
