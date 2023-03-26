import 'package:flutter/cupertino.dart';

class GlobalSpan extends TextSpan {
  GlobalSpan({
    required this.globalKey,
    required this.child,
  }) : super(
          children: [
            WidgetSpan(
              child: SizedBox.fromSize(
                key: globalKey,
                size: Size.zero,
              ),
            ),
            child
          ],
        );

  final GlobalKey globalKey;
  final TextSpan child;
}
