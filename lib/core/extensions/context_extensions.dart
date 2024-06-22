import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension Contexts on BuildContext {
  customPush(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  customPushReplaceMent(Widget widget) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  customPop(Widget widget) {
    Navigator.of(this).pop();
  }
}

extension MediaQuaryUtils on BuildContext {
  tellMeScreenHeight() {
    final val = MediaQuery.sizeOf(this).height;
    if (kDebugMode) {
      print(val.toString());
    }
  }

  tellMeScreenWidth() {
    final val = MediaQuery.sizeOf(this).width;

    if (kDebugMode) {
      print(val.toString());
    }
  }
}
