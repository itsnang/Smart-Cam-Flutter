import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitSafe<S> extends Cubit<S> {
  CubitSafe(super.initialState);

  @override
  void emit(S state) {
    if (isClosed) return;
    super.emit(state);
  }
}

extension BlocX<E, S> on Bloc<E, S> {
  void safeEmit(Emitter<S> emit, S state) {
    if (isClosed) return;
    emit(state);
  }
}
