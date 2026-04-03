import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.buttonSize = 40,
    this.borderRadius = 8,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.fillColor = Colors.transparent,
    this.disabledColor,
    this.hoverColor,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final double buttonSize;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color fillColor;
  final Color? disabledColor;
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        hoverColor: hoverColor ?? Colors.transparent,
        child: Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
