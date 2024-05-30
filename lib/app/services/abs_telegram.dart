import 'dart:io';

abstract class AbsAnalyticServiceAdapter {
  Future<void> init();

  void sendPhoto({File? photo});
}
