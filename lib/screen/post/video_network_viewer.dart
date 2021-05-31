import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class VideoNetworkViewer extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;

  VideoNetworkViewer({
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  _VideoNetworkViewerState createState() => _VideoNetworkViewerState();
}

class _VideoNetworkViewerState extends State<VideoNetworkViewer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: VideoPlayer(_controller),
            ),
          )
        : CachedNetworkImage(imageUrl: widget.thumbnailUrl);
  }
}
