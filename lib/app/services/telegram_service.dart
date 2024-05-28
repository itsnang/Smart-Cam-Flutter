import 'dart:developer';
import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:update_her/app/services/abs_telegram.dart';

class TelegramService extends AbsAnalyticServiceAdapter {
  var BOT_TOKEN = '7101402290:AAGjxXm57K-1q8DZiXcgyDI4wZX8-peqL5A';
  var GROUP_ID = '-4279231714';
  late TeleDart teledart;
  @override
  Future<void> init() async {
    final username = (await Telegram(BOT_TOKEN).getMe()).username;
    teledart = TeleDart(BOT_TOKEN, Event(username ?? ''));
    teledart.start();
    await teledart.sendMessage(GROUP_ID, 'Bot started!');
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
