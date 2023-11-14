import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ImageZoomViewer extends StatefulWidget {
  final String imgUrl;
  const ImageZoomViewer({
    required this.imgUrl,
    super.key,
  });

  @override
  State<ImageZoomViewer> createState() => _ImageZoomViewerState();
}

class _ImageZoomViewerState extends State<ImageZoomViewer> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: InteractiveViewer(
          maxScale: 5.0,
          child: Image.network(
            widget.imgUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
