import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MaskedImage extends StatelessWidget {
  const MaskedImage({Key? key, required this.image, required this.child})
      : super(key: key);

  final ImageProvider image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: loadImage(),
      builder: (context, snapshot) => snapshot.hasData
          ? ShaderMask(
              blendMode: ui.BlendMode.srcATop,
              shaderCallback: (bounds) => ui.ImageShader(
                snapshot.data!,
                ui.TileMode.clamp,
                ui.TileMode.clamp,
                Matrix4.identity().storage,
              ),
              child: child,
            )
          : const SizedBox.shrink(),
    );
  }

  Future<ui.Image> loadImage() {
    var _completer = Completer<ui.Image>();
    var _imgConfig = image.resolve(const ImageConfiguration());
    _imgConfig.addListener(
      ImageStreamListener(
        (info, _) => _completer.complete(info.image),
      ),
    );
    return _completer.future;
  }
}
