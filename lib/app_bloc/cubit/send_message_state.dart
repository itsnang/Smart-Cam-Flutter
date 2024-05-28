part of 'send_message_cubit.dart';

class SendMessageState extends Equatable {
  const SendMessageState.loading() : this._(status: StateStatus.loading);

  const SendMessageState.pickImage({
    String? filePath,
  }) : this._(
          status: StateStatus.success,
          filePath: filePath,
        );

  const SendMessageState.fail() : this._(status: StateStatus.failure);

  const SendMessageState.init() : this._(status: StateStatus.empty);

  const SendMessageState._({
    this.status = StateStatus.initial,
    this.filePath = '',
  });

  const SendMessageState.sendImage() : this._(status: StateStatus.success);

  final StateStatus status;
  final String? filePath;

  @override
  List<Object?> get props => [status];
}
