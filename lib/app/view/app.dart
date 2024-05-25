import 'package:flutter/material.dart';
import 'package:update_her/pages/home/home.dart';
import 'package:update_her/pages/splash/splash_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final Future<String> timer =
        Future<String>.delayed(const Duration(seconds: 2), () => "");

    return FutureBuilder<String>(
      future: timer,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget child;
        if (!snapshot.hasData) {
          child = const SplashScreen(key: ValueKey(0));
        } else if (snapshot.hasError) {
          child = const Text("Something went wrong");
        } else {
          child = const HomePage();
        }

        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: child,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            });
      },
    );
  }
}
