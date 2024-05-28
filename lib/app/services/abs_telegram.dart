import 'dart:io';

abstract class AbsAnalyticServiceAdapter {
  Future<void> init();

  void sendPhoto({required String chatId, File? photo});
}
