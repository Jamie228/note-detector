import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:object_detection/note_info.dart';
import 'package:object_detection/note.dart';

class BoundingBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  BoundingBox(
    this.results,
    this.previewH,
    this.previewW,
    this.screenH,
    this.screenW,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBox() {
      return results.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        return Positioned(
            left: math.max(0, x),
            top: math.max(0, y),
            width: w,
            height: h,
            child: GestureDetector(
              onTap: () => noteInfo(re['detectedClass'], context),
              child: Container(
                padding: EdgeInsets.only(top: 5.0, left: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(37, 213, 253, 1.0),
                    width: 3.0,
                  ),
                ),
                child: Text(
                  "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ));
      }).toList();
    }

    return Stack(
      children: _renderBox(),
    );
  }

  noteInfo(String detectedClass, context) {
    //Fluttertoast.showToast(msg: detectedClass, toastLength: Toast.LENGTH_SHORT);
    Note note;
    for (var n in noteList) {
      if (n.name == detectedClass) {
        note = n;
      }
    }

    final theme = Theme.of(context);

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text(
                    note.displayName,
                    style: theme.textTheme.subtitle1
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                  tileColor: theme.colorScheme.primary,
                ),
                new ListTile(
                  title: new Text(
                    note.description,
                    style: TextStyle(height: 1.5),
                  ),
                  leading: new Icon(Icons.info),
                ),
                new ListBody(
                  children: [
                    new Image.asset('assets/images/' + note.imagePath)
                  ],
                )
              ],
            ),
          );
        });
  }
}
