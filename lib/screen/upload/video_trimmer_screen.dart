import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoTrimmerScreen extends StatefulWidget {
  final Trimmer _trimmer;
  VideoTrimmerScreen(this._trimmer);
  @override
  _VideoTrimmerScreenState createState() => _VideoTrimmerScreenState();
}

class _VideoTrimmerScreenState extends State<VideoTrimmerScreen> {
  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  Future<String?> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String? _value;

    await widget._trimmer
        .saveTrimmedVideo(startValue: _startValue, endValue: _endValue)
        .then((value) {
      setState(() {
        _progressVisibility = false;
        _value = value;
      });
    });

    return _value;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Video Trimmer"),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Visibility(
                    visible: _progressVisibility,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _progressVisibility
                        ? null
                        : () async {
                            _saveVideo().then((value) async {
                              if (value != null) {
                                final savedResult =
                                    await ImageGallerySaver.saveFile(value,
                                        isReturnPathOfIOS: Platform.isIOS);
                                print('savedResult: ' + savedResult.toString());
                                File videoFile = File(savedResult['filePath']);

                                Navigator.pop(context, videoFile);
                              }
                            });
                          },
                    child: Text("완료"),
                  ),
                  Expanded(
                    child: VideoViewer(),
                  ),
                  Center(
                    child: TrimEditor(
                      borderPaintColor: Colors.purple,
                      circlePaintColor: Colors.purple,
                      viewerHeight: 50.0,
                      viewerWidth: MediaQuery.of(context).size.width,
                      maxVideoLength: Duration(seconds: 15),
                      onChangeStart: (value) {
                        _startValue = value;
                      },
                      onChangeEnd: (value) {
                        _endValue = value;
                      },
                      onChangePlaybackState: (value) {
                        setState(() {
                          _isPlaying = value;
                        });
                      },
                    ),
                  ),
                  TextButton(
                    child: _isPlaying
                        ? Icon(
                            Icons.pause,
                            size: 80.0,
                            color: Colors.purple,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 80.0,
                            color: Colors.purple,
                          ),
                    onPressed: () async {
                      bool playbackState =
                          await widget._trimmer.videPlaybackControl(
                        startValue: _startValue,
                        endValue: _endValue,
                      );
                      setState(() {
                        _isPlaying = playbackState;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
