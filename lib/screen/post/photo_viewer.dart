import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golden_balance_flutter/constant/color.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final String photoUrl;

  const PhotoViewer({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBlackColor,
      body: SafeArea(
        child: Container(
            child: PhotoView(
          backgroundDecoration: BoxDecoration(color: kBackgroundGreyColor),
          imageProvider: CachedNetworkImageProvider(photoUrl),
        )),
      ),
    );
  }
}
