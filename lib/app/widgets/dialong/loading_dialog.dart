import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

extension LoadingDialogExt on BuildContext {
  static bool isShowing = false;

  void showLoadingDialog() {
    if (isShowing) {
      return;
    }
    isShowing = true;
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      // useRootNavigator: true, //required false for support Go Router Event
      builder: (BuildContext context) {
        return const LoadingDialog._();
      },
    );
  }

  void dismissLoadingDialog() {
    if (isShowing) {
      isShowing = false;
      Navigator.of(this, rootNavigator: true).pop();
    }
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog._();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.dialogBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: LottieBuilder.asset(
                'assets/lotties/amongus.json',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
