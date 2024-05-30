import 'dart:developer';
import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:update_her/app/services/abs_telegram.dart';

class TelegramService extends AbsAnalyticServiceAdapter {
  var botToken = const String.fromEnvironment('BOT_TOKEN');
  static const groupId = String.fromEnvironment('GROUP_ID');
  late TeleDart teledart;
  @override
  Future<void> init() async {
    final username = (await Telegram(botToken).getMe()).username;
    teledart = TeleDart(botToken, Event(username ?? ''));
    teledart.start();
  }

  @override
  void sendPhoto({File? photo}) {
    log('======> $photo');
    try {
      if (photo == null) {
        return;
      }
      teledart.sendPhoto(groupId, photo);
    } catch (e) {
      rethrow;
    }
  }
}
