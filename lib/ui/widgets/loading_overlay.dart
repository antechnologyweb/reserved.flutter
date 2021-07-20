import 'package:flutter/material.dart';

class LoadingOverlay {
  static OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      );
      Overlay.of(context)!.insert(_overlay!);
    }
  }

  void hide(BuildContext context) {
    // Navigator.pop(context);
    if (_overlay != null) {
      _overlay!.remove();
      // Overlay.of(context)!.dispose();
      _overlay = null;
    }
  }
}
