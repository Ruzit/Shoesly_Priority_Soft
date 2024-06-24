import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

enum ButtonWidth { large, small }

class AppButton extends StatelessWidget {
  final String buttonText;
  final ButtonWidth buttonWidth;
  final EdgeInsets padding;
  final GestureTapCallback? onPressed;
  final Duration duration;
  final double? width;
  final double? height;
  final TextStyle fontStyle;
  final Widget? leadingWidget;
  final Color? backgroundColor;
  final Color? borderColor;
  final OutlinedBorder outlinedBorder;
  final Gradient? backgroundGradient;

  const AppButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.buttonWidth = ButtonWidth.large,
    this.padding = const EdgeInsets.all(24.0),
    this.duration = const Duration(seconds: 5),
    this.leadingWidget,
    this.width,
    this.height = 45,
    this.fontStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        overflow: TextOverflow.ellipsis),
    this.backgroundColor,
    this.outlinedBorder = const StadiumBorder(),
    this.backgroundGradient,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ??
          (buttonWidth == ButtonWidth.small
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width / 1.10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        color: backgroundColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: outlinedBorder,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingWidget ?? const SizedBox(),
            Text(
              buttonText,
              style: fontStyle,
            )
          ],
        ),
      ),
    ).center(heightFactor: 1.8);
  }
}
