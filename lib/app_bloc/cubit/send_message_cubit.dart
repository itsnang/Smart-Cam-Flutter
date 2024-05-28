import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:update_her/app/enum/state_status_enum.dart';

import 'package:update_her/app/services/telegram_init.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(const SendMessageState.init());

  Future<void> pickImage({required String filePath}) async {
    emit(const SendMessageState.loading());
    emit(SendMessageState.pickImage(filePath: filePath));
  }

  Future<void> sendImage({File? photo}) async {
    emit(const SendMessageState.loading());
    BaseTelegramService.instance.sendPhoto(chatId: '', photo: photo!);
    emit(SendMessageState.sendImage());
  }
}
