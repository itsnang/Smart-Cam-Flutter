import 'dart:io';

abstract class AbsAnalyticServiceAdapter {
  Future<void> init();

  Future<void> sendPhoto({File? photo});
}
