import 'package:flutter/material.dart';
import 'package:update_her/app/assets/images.dart';
import 'package:update_her/app/theme/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton(
    this.text, {
    super.key,
    this.style,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.shape,
    this.elevation,
    this.loading = false,
    this.isOutlinedButton = false,
    this.buttonSide,
    this.buttonTheme,
    this.icon,
  });

  factory MyButton.light(
    String text, {
    Image? icon,
    EdgeInsets? padding,
    bool loading = false,
    VoidCallback? onPressed,
  }) {
    return MyButton(
      text,
      onPressed: onPressed,
      elevation: 0,
      width: double.infinity,
      loading: loading,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      buttonTheme: CellcardButtonTheme.light,
      icon: icon,
    );
  }

  factory MyButton.blue(
    String text, {
    Image? icon,
    EdgeInsets? padding,
    bool loading = false,
    VoidCallback? onPressed,
    TextStyle? textStyle,
  }) {
    return MyButton(
      text,
      onPressed: onPressed,
      elevation: 0,
      width: double.infinity,
      loading: loading,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      buttonTheme: CellcardButtonTheme.blue,
      icon: icon,
      style: textStyle,
    );
  }

  /// The text to display.
  final String text;

  /// The style of the button text.
  final TextStyle? style;

  /// Called when the button is tapped or otherwise activated.
  final Color? backgroundColor;

  /// The button foreground color.
  final Color? foregroundColor;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  final EdgeInsetsGeometry? padding;

  final OutlinedBorder? shape;

  final double? elevation;

  /// indicate the button in loading state.
  final bool loading;

  /// Option for outlined button || elevated button
  final bool isOutlinedButton;

  final BorderSide? buttonSide;

  final CellcardButtonTheme? buttonTheme;

  /// The button icon.
  final Image? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonShape = shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        );
    final buttonElevation = elevation ?? 0;
    final textStyle = _getTextStyle(theme);

    return SizedBox(
      height: height,
      width: width,
      child: !isOutlinedButton
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: _getBackgroundColor(theme),
                foregroundColor: _getForegroundColor(theme),
                elevation: buttonElevation,
                padding: padding,
                shape: buttonShape,
                disabledBackgroundColor:
                    _getBackgroundColor(theme).withOpacity(0.5),
              ),
              onPressed: onPressed == null
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onPressed?.call();
                    },
              child: loading
                  ? SizedBox(
                      height: 25,
                      child: ImageAsset.of().circularProgressIndicator)
                  : _buildText(textStyle),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                alignment: Alignment.center,
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor,
                elevation: buttonElevation,
                side: buttonSide,
                padding: padding,
                shape: buttonShape,
              ),
              onPressed: onPressed == null
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onPressed?.call();
                    },
              child: loading
                  ? SizedBox(
                      height: 25,
                      child: ImageAsset.of().circularProgressIndicator)
                  : _buildText(textStyle),
            ),
    );
  }

  Widget _buildText(TextStyle? textStyle) {
    final textWidget = Text(
      text,
      style: textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (icon == null) {
      return textWidget;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        const SizedBox(width: 8),
        textWidget,
      ],
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (backgroundColor != null) {
      return backgroundColor!;
    }
    if (buttonTheme == null) {
      return theme.colorScheme.secondary;
    }
    if (buttonTheme == CellcardButtonTheme.light) {
      return theme.cardColor;
    } else {
      return theme.colorScheme.secondary;
    }
  }

  Color? _getForegroundColor(ThemeData theme) {
    if (foregroundColor != null) {
      return foregroundColor!;
    }
    if (buttonTheme != null) {
      if (buttonTheme != CellcardButtonTheme.light) {
        return theme.cardColor;
      } else {
        return theme.colorScheme.primary;
      }
    }
    return null;
  }

  TextStyle? _getTextStyle(ThemeData theme) {
    if (style != null) {
      return style;
    }
    if (buttonTheme == null) {
      return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: foregroundColor ?? theme.colorScheme.surface,
      );
    }

    Color color;
    if (buttonTheme == CellcardButtonTheme.light) {
      color = theme.colorScheme.secondary;
    } else {
      color = MyAppColors.white;
    }
    return theme.textTheme.titleSmall?.copyWith(
      color: onPressed == null ? color.withOpacity(0.5) : color,
    );
  }
}

enum CellcardButtonTheme { light, blue }
