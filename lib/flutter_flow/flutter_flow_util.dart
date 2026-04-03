import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:go_router/go_router.dart';

// ─── TextStyle.override() extension ───────────────────────────────────────────
extension TextStyleOverride on TextStyle {
  TextStyle override({
    TextStyle? font,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return copyWith(
      fontFamily: font?.fontFamily,
      fontFamilyFallback: font?.fontFamilyFallback,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: lineHeight,
      decoration: decoration,
    );
  }
}

// ─── FlutterFlowModel base class ──────────────────────────────────────────────
abstract class FlutterFlowModel<T extends StatefulWidget> {
  void initState(BuildContext context);
  void dispose();
}

W createModel<W extends FlutterFlowModel>(
  BuildContext context,
  W Function() builder,
) {
  final model = builder();
  model.initState(context);
  return model;
}

// ─── Navigation: TransitionInfo + PageTransitionType ─────────────────────────
enum PageTransitionType {
  rightToLeft,
  leftToRight,
  bottomToTop,
  topToBottom,
  fade,
  scale,
  none,
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;
}

// ─── List extension: divide / addToStart / addToEnd ──────────────────────────
extension ListDivideExt<T extends Widget> on Iterable<T> {
  List<Widget> divide(Widget t) {
    final list = toList();
    if (list.isEmpty) return [];
    final result = <Widget>[];
    for (int i = 0; i < list.length; i++) {
      result.add(list[i]);
      if (i < list.length - 1) result.add(t);
    }
    return result;
  }

  List<Widget> addToStart(Widget t) => [t, ...this];

  List<Widget> addToEnd(Widget t) => [...this, t];
}
