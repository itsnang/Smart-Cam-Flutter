import 'package:flutter/material.dart';

class BottomShadowContainer extends StatelessWidget {
  const BottomShadowContainer({
    super.key,
    required this.children,
    this.hideShadow = false,
    this.color,
  });

  final List<Widget> children;
  final bool hideShadow;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? Theme.of(context).colorScheme.background;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: hideShadow
            ? []
            : [
                BoxShadow(
                  offset: const Offset(0, -2),
                  color: const Color(0XFF000000).withOpacity(0.2),
                  blurRadius: 4,
                ),
              ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
