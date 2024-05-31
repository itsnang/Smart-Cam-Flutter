part of 'send_message_cubit.dart';

class SendMessageState extends Equatable {
  const SendMessageState({this.status = StateStatus.initial, this.filePath});
  final StateStatus status;
  final String? filePath;

  SendMessageState copyWith({StateStatus? status, String? filePath}) {
    return SendMessageState(status: status ?? this.status, filePath: filePath);
  }

  @override
  List<Object?> get props => [status];
}
