import 'package:flutter/material.dart';

const Map<String, int> colorMap = {
  'aqua': 0x00FFFF,
  'black': 0x000000,
  'blue': 0x0000FF,
  'brown': 0x9A6324,
  'cream': 0xFFFDD0,
  'cyan': 0x46f0f0,
  'green': 0x00FF00,
  'gray': 0x808080,
  'grey': 0x808080,
  'mint': 0xAAFFC3,
  'lavender': 0xE6BEFF,
  'new': 0xFFFF00,
  'olive': 0x808000,
  'orange': 0xFFA500,
  'pink': 0xFFE1E6,
  'purple': 0x800080,
  'red': 0xFF0000,
  'silver': 0xC0C0C0,
  'white': 0xFFFFFF,
  'yellow': 0xFFFF00,
  'search_result': 0xECC950,
};

Color parseColor(String color) {
  final v = colorMap[color];
  if (v == null) {
    return fromHex(color);
  } else {
    final out = Color((0xff << 24) | v);
    return out;
  }
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) {
    buffer.write('ff');
  }

  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
