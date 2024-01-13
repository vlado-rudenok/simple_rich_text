import 'package:flutter/material.dart';

import 'models/commands.dart';

extension Convertible on Map<String, String> {
  TextDecorationStyle? parseDecorationStyle() {
    if (containsKey('decorationStyle')) {
      if (this['decorationStyle'] == 'dashed') {
        return TextDecorationStyle.dashed;
      }
      if (this['decorationStyle'] == 'double') {
        return TextDecorationStyle.double;
      }
      if (this['decorationStyle'] == 'dotted') {
        return TextDecorationStyle.dotted;
      }
      if (this['decorationStyle'] == 'solid') {
        return TextDecorationStyle.solid;
      }
      if (this['decorationStyle'] == 'wavy') {
        return TextDecorationStyle.wavy;
      }
    }
    return null;
  }

  bool containsCommands() =>
      containsKey(Commands.popRoute.rawValue) ||
      containsKey(Commands.tap.rawValue) ||
      containsKey(Commands.pushRoute.rawValue) ||
      containsKey(Commands.replaceRoute.rawValue) ||
      containsKey(Commands.openLink.rawValue);
}
