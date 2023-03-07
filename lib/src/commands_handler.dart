import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'commands.dart';

class CommandHandler {
  CommandHandler._();

  static Future<void> handleTap({
    required String caption,
    required Map<String, String> map,
    required BuildContext context,
    required void Function(String) log,
  }) async {
    if (map.containsKey(Commands.pushRoute.rawValue)) {
      await CommandHandler._onCommandPush(
        value: map[Commands.pushRoute.rawValue]!,
        caption: caption,
        context: context,
        log: log,
      );
    } else if (map.containsKey(Commands.replaceRoute.rawValue)) {
      await CommandHandler._onCommandReplace(
        value: map[Commands.replaceRoute.rawValue]!,
        caption: caption,
        context: context,
        log: log,
      );
    } else if (map.containsKey(Commands.openLink.rawValue)) {
      await CommandHandler._onCommandLink(
        value: map[Commands.openLink.rawValue]!,
        caption: caption,
        log: log,
      );
    } else {
      CommandHandler._onCommandPop(
        caption: caption,
        context: context,
        log: log,
      );
    }
  }

  static Future<void> _onCommandLink({
    required String value,
    required String caption,
    required void Function(String) log,
  }) async {
    log('TAP: HTTP: $caption => /$value');

    try {
      await launchUrlString('http://$value');
    } catch (e) {
      log('Could not launch http://$value: $e');
      try {
        await launchUrlString('https://$value');
      } catch (e) {
        log('Could not launch https://$value: $e');
      }
    }
  }

  static void _onCommandPop({
    required String caption,
    required BuildContext context,
    required void Function(String) log,
  }) {
    log('TAP: $caption => pop');
    Navigator.pop(context);
  }

  static Future<void> _onCommandReplace({
    required String value,
    required String caption,
    required BuildContext context,
    required void Function(String) log,
  }) async {
    log('TAP: POP&PUSH: $caption => /$value');
    await Navigator.popAndPushNamed(context, '/$value');
  }

  static Future<void> _onCommandPush({
    required String value,
    required String caption,
    required BuildContext context,
    required void Function(String) log,
  }) async {
    log('TAP: PUSH: $caption => /$value');
    await Navigator.pushNamed(context, '/$value');
  }
}
