import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:update_her/app/enum/state_status_enum.dart';
import 'package:update_her/app/extension/bloc_extension.dart';

import 'package:update_her/app/services/telegram_init.dart';

part 'send_message_state.dart';

class SendMessageCubit extends CubitSafe<SendMessageState> {
  SendMessageCubit() : super(const SendMessageState());

  Future<void> pickImage({required String filePath}) async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, filePath: filePath));
  }

  // Future<void> sendImage({File? photo}) async {
  //   emit(const SendMessageState.loading());
  //   BaseTelegramService.instance.sendPhoto(photo: photo!);
  //   emit(SendMessageState.sendImage());
  // }
}
