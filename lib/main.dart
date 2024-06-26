import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_her/app/services/telegram_init.dart';
import 'package:update_her/app/theme/theme.dart';
import 'package:update_her/app/view/app.dart';

import 'app_bloc/cubit/send_message_cubit.dart';

void main() async {
  await BaseTelegramService.instance.initSdk();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight(),
      home: BlocProvider(
        create: (context) => SendMessageCubit(),
        child: const StartPage(),
      ),
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();

  static final _darkTheme = ThemeData.dark();

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
