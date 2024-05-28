import 'dart:developer';
import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:update_her/app/services/abs_telegram.dart';

class TelegramService extends AbsAnalyticServiceAdapter {
  var botToken = const String.fromEnvironment('BOT_TOKEN');
  late TeleDart teledart;
  @override
  Future<void> init() async {
    const groupId = String.fromEnvironment('GROUP_ID');
    final username = (await Telegram(botToken).getMe()).username;
    teledart = TeleDart(botToken, Event(username ?? ''));
    teledart.start();
    await teledart.sendMessage(groupId, 'Bot started!');
  }

  @override
  void sendPhoto({required chatId, File? photo}) {
    log('======> ${photo}');
    try {
      if (photo == null) {
        return;
      }
      teledart.sendPhoto(chatId, photo);
    } catch (e) {
      rethrow;
    }
  }
}
