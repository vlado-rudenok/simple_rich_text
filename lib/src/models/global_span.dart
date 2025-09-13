import 'package:flutter/cupertino.dart';

class ExtendedGlobalKey {
  ExtendedGlobalKey({required this.paragraph}) : key = GlobalKey();

  final GlobalKey key;
  final int? paragraph;
}

class GlobalSpan extends TextSpan {
  GlobalSpan({required this.child, this.globalKey})
    : super(
        children: [
          if (globalKey != null)
            WidgetSpan(
              child: SizedBox.fromSize(key: globalKey.key, size: Size.zero),
            ),
          child,
        ],
      );

  final ExtendedGlobalKey? globalKey;
  final TextSpan child;
}
