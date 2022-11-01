import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  /// Envuelve el widget en un [Padding]
  Widget padding(EdgeInsets padding, {Key? key}) =>
      Padding(key: key, padding: padding, child: this);

  /// Envuelve el widget en un [Padding]
  Widget paddingAll(double padding, {Key? key}) =>
      this.padding(EdgeInsets.all(padding), key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingOnly({
    Key? key,
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      padding(
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
          key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingLeft(double left, {Key? key}) =>
      paddingOnly(left: left, key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingTop(double top, {Key? key}) => paddingOnly(top: top, key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingRight(double right, {Key? key}) =>
      paddingOnly(right: right, key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingBottom(double bottom, {Key? key}) =>
      paddingOnly(bottom: bottom, key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingSymmetric({
    Key? key,
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      padding(EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingVertical(double vertical, {Key? key}) =>
      paddingSymmetric(vertical: vertical, key: key);

  /// Envuelve el widget en un [Padding]
  Widget paddingHorizontal(double horizontal, {Key? key}) =>
      paddingSymmetric(horizontal: horizontal, key: key);

  /// Envuelve al widget en un [SafeArea]
  SafeArea safeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: minimum,
          maintainBottomViewPadding: maintainBottomViewPadding,
          child: this);

  /// Envuelve el widget en un [SizedBox]
  Widget sizedBox({Key? key, double? width, double? height}) =>
      SizedBox(key: key, width: width, height: height, child: this);

  /// Envuelve el widget en un [SizedBox]
  Widget sized(double size) => sizedBox(key: key, width: size, height: size);

  /// Envuelve el widget en un [SizedBox]
  Widget width(double width, {Key? key}) => sizedBox(key: key, width: width);

  /// Envuelve el widget en un [SizedBox]
  Widget height(double height, {Key? key}) =>
      sizedBox(key: key, height: height);

  /// Envuelve el widget en un [FractionallySizedBox]
  Widget fractionallySized({
    Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor = 1,
    double? heightFactor = 1,
  }) =>
      FractionallySizedBox(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// Envuelve el widget en un [IntrinsicHeight]
  Widget intrinsicHeight({Key? key}) => IntrinsicHeight(key: key, child: this);

  /// Envuelve el widget en un [IntrinsicWidth]
  Widget intrinsicWidth({Key? key}) => IntrinsicWidth(key: key, child: this);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget constrained({
    Key? key,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) =>
      ConstrainedBox(
        key: key,
        constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight),
        child: this,
      );

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget minWidth(double minWidth, {Key? key}) =>
      constrained(key: key, minWidth: minWidth);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget minHeight(double minHeight, {Key? key}) =>
      constrained(key: key, minHeight: minHeight);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget min({Key? key, required double width, required double height}) =>
      constrained(key: key, minWidth: width, minHeight: height);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget maxWidth(double maxWidth, {Key? key}) =>
      constrained(key: key, maxWidth: maxWidth);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget maxHeight(double maxHeight, {Key? key}) =>
      constrained(key: key, maxHeight: maxHeight);

  /// Envuelve al Widget en un [ConstrainedBox].
  Widget max({Key? key, required double width, required double height}) =>
      constrained(key: key, maxWidth: width, maxHeight: height);

  /// Envuelve el widget en un [FittedBox]
  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
          key: key,
          fit: fit,
          alignment: alignment,
          clipBehavior: clipBehavior,
          child: this);

  Widget fitWidth({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      fittedBox(
          key: key,
          fit: BoxFit.fitWidth,
          alignment: alignment,
          clipBehavior: clipBehavior);

  Widget fitHeight({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      fittedBox(
          key: key,
          fit: BoxFit.fitHeight,
          alignment: alignment,
          clipBehavior: clipBehavior);

  /// Envuelve al Widget en un [AspectRatio].
  Widget aspectRatio(double ascectRatio, {Key? key}) =>
      AspectRatio(aspectRatio: ascectRatio, key: key, child: this);

  /// Envuelve al Widget en un [Align].
  /// [Center] es lo mismo que [Align] solo que [alignment] es siempre [Alignment.center]
  Widget align({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Align(
          key: key,
          alignment: alignment,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: this);

  /// Envuelve al Widget en un [Center].
  /// [Center] es lo mismo que [Align] solo que [alignment] es siempre [Alignment.center]
  Center center({Key? key, double? widthFactor, double? heightFactor}) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// Envuelve al Widget en un [Flexible].
  Widget flexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(key: key, flex: flex, fit: fit, child: this);

  /// Envuelve al Widget en un [Expanded].
  /// [Flexible] con [FlexFit.tight]
  Widget expanded({Key? key, int flex = 1}) =>
      Expanded(key: key, flex: flex, child: this);

  /// Envuelve al Widget en un [ColoredBox].
  Widget backgroundColor(Color color, {Key? key}) =>
      ColoredBox(color: color, child: this);

  /// Envuelve al Widget en un [Container] con un [BoxDecoration] con un
  /// gradient [LinearGradient].
  Widget linearGradient({
    Key? key,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    required List<Color> colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      Container(
        key: key,
        child: this,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: colors,
                stops: stops,
                tileMode: tileMode,
                transform: transform)),
      );

  /// Envuelve al Widget en un [RotatedBox]
  Widget rotate(int quarterTurns) =>
      RotatedBox(quarterTurns: quarterTurns, child: this);

  /// Envuelve al Widget en un [Container] con un [BoxDecoration]
  /// con un [gradient]
  Widget gradient(Gradient gradient) =>
      Container(decoration: BoxDecoration(gradient: gradient), child: this);

  /// Envuelve al Widget en un [ClipRRect].
  Widget cornerRadius(
    double? borderRadius, {
    Key? key,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
          key: key,
          borderRadius: borderRadius == null
              ? BorderRadius.zero
              : BorderRadius.circular(borderRadius),
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: this);

  Widget cornerRadiusBottom(
    double? borderRadius, {
    Key? key,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
          key: key,
          borderRadius: borderRadius == null
              ? BorderRadius.zero
              : BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: this);

  Widget cornerRadiusTop(
    double? borderRadius, {
    Key? key,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
          key: key,
          borderRadius: borderRadius == null
              ? BorderRadius.zero
              : BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
          clipper: clipper,
          clipBehavior: clipBehavior,
          child: this);

  /// Envuelve al Widget en un [Visibility].
  Widget visible(
    bool visible, {
    Key? key,
    Widget replacement = const SizedBox.shrink(),
    bool maintainState = false,
    bool maintainAnimation = false,
    bool maintainSize = false,
    bool maintainSemantics = false,
    bool maintainInteractivity = false,
  }) =>
      Visibility(
          key: key,
          child: this,
          replacement: replacement,
          visible: visible,
          maintainState: maintainState,
          maintainAnimation: maintainAnimation,
          maintainSize: maintainSize,
          maintainSemantics: maintainSemantics,
          maintainInteractivity: maintainInteractivity);

  /// Envuelve al Widget en un [Visibility].
  /// [visible] true para mostrarse, false para ocultarse manteniendo su tamaño
  Widget visibleOrInvisible(bool visible) => this.visible(
        visible,
        maintainState: !visible,
        maintainAnimation: !visible,
        maintainSize: !visible,
      );

  /// Envuelve al Widget en un [Visibility].
  /// [visible] true para mostrarse, false para ocultarse SIN mantener su tamaño
  Widget visibleOrGone(bool visible,
          {Widget replacement = const SizedBox.shrink()}) =>
      this.visible(visible, replacement: replacement);

  /// Envuelve al Widget en un [GestureDetector].
  Widget onTap(GestureTapCallback onTap, {Key? key}) =>
      gestureDetector(onTap: onTap, key: key);

  /// Envuelve al widget en un [GestureDetector]
  /// Preferible usar extensiones individuales en casos en los que
  /// solo haya que usar uno de los eventos, por ej [onTap()]
  GestureDetector gestureDetector({
    Key? key,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapCallback? onSecondaryTap,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureTapCallback? onTertiaryTapCancel,
    GestureTapDownCallback? onDoubleTapDown,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,
    GestureLongPressDownCallback? onLongPressDown,
    GestureLongPressCancelCallback? onLongPressCancel,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureLongPressDownCallback? onSecondaryLongPressDown,
    GestureLongPressCancelCallback? onSecondaryLongPressCancel,
    GestureLongPressCallback? onSecondaryLongPress,
    GestureLongPressStartCallback? onSecondaryLongPressStart,
    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    GestureLongPressUpCallback? onSecondaryLongPressUp,
    GestureLongPressEndCallback? onSecondaryLongPressEnd,
    GestureLongPressDownCallback? onTertiaryLongPressDown,
    GestureLongPressCancelCallback? onTertiaryLongPressCancel,
    GestureLongPressCallback? onTertiaryLongPress,
    GestureLongPressStartCallback? onTertiaryLongPressStart,
    GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate,
    GestureLongPressUpCallback? onTertiaryLongPressUp,
    GestureLongPressEndCallback? onTertiaryLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        child: this,
        key: key,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        onTapCancel: onTapCancel,
        onSecondaryTap: onSecondaryTap,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onTertiaryTapDown: onTertiaryTapDown,
        onTertiaryTapUp: onTertiaryTapUp,
        onTertiaryTapCancel: onTertiaryTapCancel,
        onDoubleTapDown: onDoubleTapDown,
        onDoubleTap: onDoubleTap,
        onDoubleTapCancel: onDoubleTapCancel,
        onLongPressDown: onLongPressDown,
        onLongPressCancel: onLongPressCancel,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onSecondaryLongPressDown: onSecondaryLongPressDown,
        onSecondaryLongPressCancel: onSecondaryLongPressCancel,
        onSecondaryLongPress: onSecondaryLongPress,
        onSecondaryLongPressStart: onSecondaryLongPressStart,
        onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
        onSecondaryLongPressUp: onSecondaryLongPressUp,
        onSecondaryLongPressEnd: onSecondaryLongPressEnd,
        onTertiaryLongPressDown: onTertiaryLongPressDown,
        onTertiaryLongPressCancel: onTertiaryLongPressCancel,
        onTertiaryLongPress: onTertiaryLongPress,
        onTertiaryLongPressStart: onTertiaryLongPressStart,
        onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
        onTertiaryLongPressUp: onTertiaryLongPressUp,
        onTertiaryLongPressEnd: onTertiaryLongPressEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragCancel: onVerticalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onForcePressStart: onForcePressStart,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onForcePressEnd: onForcePressEnd,
        onPanDown: onPanDown,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
      );

  /// Envuelve al Widget en un [DecoratedBox]
  Widget decoratedBox({
    Key? key,
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) =>
      DecoratedBox(
        key: key,
        decoration: decoration,
        position: position,
        child: this,
      );

  /// Envuelve al Widget en un [DecoratedBox] con [BottomBorder]
  Widget bottomBorder({
    Key? key,
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    DecorationPosition position = DecorationPosition.background,
  }) =>
      DecoratedBox(
        key: key,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: width,
              color: color,
            ),
          ),
        ),
        position: position,
        child: this,
      );

  /// Envuelve el Widget en un [Material] con un [InkWell]. (Ripple effect)
  /// ir incrementando properties a medida que haga falta
  Widget inkWell({
    Color? splashColor,
    double? circularRadius,
    GestureTapCallback? onTap,
  }) =>
      Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: circularRadius == null
                ? null
                : BorderRadius.circular(circularRadius),
            splashColor: splashColor,
            child: this,
          ));

  /// Envuelve el Widget en un [Material] con un [InkWell]. (Ripple effect)
  /// ir incrementando properties a medida que haga falta
  Widget circleInkWell({
    Color? splashColor,
    GestureTapCallback? onTap,
  }) =>
      ClipOval(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              splashColor: splashColor,
              child: this,
            )),
      );

  Widget translate(
    double dx,
    double dy, {
    Key? key,
  }) =>
      Transform.translate(key: key, offset: Offset(dx, dy), child: this);

  Widget greyScale({
    Key? key,
    double opacity = 1,
  }) =>
      ColorFiltered(
        key: key,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(opacity), // 0 colored, 1 black and white
          BlendMode.saturation,
        ),
        child: this,
      );
}