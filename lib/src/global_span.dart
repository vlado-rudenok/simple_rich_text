import 'package:flutter/cupertino.dart';

class GlobalSpan extends TextSpan {
  GlobalSpan({
    required this.child,
    this.globalKey,
  }) : super(
          children: [
            if (globalKey != null)
              WidgetSpan(
                child: SizedBox.fromSize(
                  key: globalKey,
                  size: Size.zero,
                ),
              ),
            child,
          ],
        );

  final GlobalKey? globalKey;
  final TextSpan child;
}
