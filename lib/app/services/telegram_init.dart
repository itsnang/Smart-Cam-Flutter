import 'dart:io';

import 'package:flutter/material.dart';
import 'package:update_her/app/services/abs_telegram.dart';
import 'package:update_her/app/services/telegram_service.dart';

class BaseTelegramService extends WidgetsBindingObserver {
  BaseTelegramService._();
  static BaseTelegramService get instance => _instance;
  static final BaseTelegramService _instance = BaseTelegramService._();

  static final AbsAnalyticServiceAdapter _services = TelegramService();

  Future<void> initSdk() async {
    await Future.wait([_services.init()]);
  }

  Future<void> sendPhoto({required File photo}) async {
    _services.sendPhoto(photo: photo);
  }
}
