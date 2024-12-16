import 'package:flutter/material.dart';

class CustomRadio<T> extends StatefulWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
  });


  /// The value represented by this radio button.
  final T value;
  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the [groupValue].
  final T? groupValue;
  /// Called when the radio button is selected.
  final ValueChanged<T?>? onChanged;
  /// Determines whether the radio button can be toggled between selected and unselected states.
  final bool toggleable;
  bool get _selected => value == groupValue;

  @override
  State<CustomRadio<T>> createState() => _CustomRadioState<T>();
}

class _CustomRadioState<T> extends State<CustomRadio<T>> with TickerProviderStateMixin, ToggleableStateMixin {
  final _CustomRadioPainter _painter = _CustomRadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(CustomRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      checked: widget._selected,
      inMutuallyExclusiveGroup: true,
      child: buildToggleable(
          mouseCursor: WidgetStateProperty.resolveWith(
                  (states) => WidgetStateMouseCursor.clickable
          ),
          size: const Size(50.0, 50.0),
          painter: _painter
            ..position = position
            ..reaction = reaction
            ..reactionFocusFade = reactionFocusFade
            ..reactionHoverFade = reactionHoverFade
            ..inactiveReactionColor = Colors.transparent
            ..reactionColor = Colors.transparent
            ..hoverColor = Colors.transparent
            ..focusColor = Colors.transparent
            ..splashRadius = 10 * 2
            ..downPosition = downPosition
            ..isFocused = states.contains(WidgetState.focused)
            ..isHovered = states.contains(WidgetState.hovered)
          // Set dot color to black and outer circle to blue when active
            ..dotColor = Colors.black
            ..dotRadius = 3.5
            ..radius = 8.0
            ..inactiveFillColor = Colors.transparent // Set the inside fill of the radio to transparent when inactive
            ..activeColor =  Colors.blue// Blue when active
            ..inactiveColor = Colors.grey // Set the border of the radio to grey when inactive
            ..activeFillColor = Colors.blue
            ..animateFillColor = false
            ..dotStyle = const DotStyle.circle()
            ..shape =  const RadioShape.circle()
      ),
    );
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;
}

class _CustomRadioPainter extends ToggleablePainter {
  set dotColor(Color? color) {
    _dotColor = color;
  }
  set activeFillColor(Color? color) {
    _activeFillColor = color;
  }
  set inactiveFillColor(Color? color) {
    _inactiveFillColor = color;
  }
  set radius(double value) {
    _radius = value;
  }
  set dotRadius(double value) {
    _dotRadius = value;
  }
  set animateFillColor(bool value) {
    _animateFillColor = value;
  }
  set dotStyle(DotStyle style) {
    _dotStyle = style;
  }
  set shape(RadioShape shape) {
    _shape = shape;
  }

  Color? _dotColor;

  Color? _activeFillColor;

  Color? _inactiveFillColor;

  double _radius = 8.0;

  double _dotRadius = 4.5;

  bool _animateFillColor = false;

  DotStyle _dotStyle = const DotStyle.circle();

  RadioShape _shape = const RadioShape.circle();

  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));
    final Offset center = (Offset.zero & size).center;
    final Paint paint = Paint()

    //Draws a circle in the canvas....
      ..color = Color.lerp(inactiveColor, activeColor, position.value)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;


    _shape.when(
      // Only for Circle Style Radio...
        circle: (){
          _drawOuterCircleShape(center, canvas, paint);
        }
    );

    // when inactive....
    if (_inactiveFillColor != null && position.isDismissed) {
      paint.color = _inactiveFillColor!;
      paint.style = PaintingStyle.fill;
      _shape.when(
        circle: () {
          canvas.drawCircle(center, _radius, paint);
        },
      );}

    // Draw active fill color (if applicable)
    if (_activeFillColor != null && !position.isDismissed) {
      paint.color = _activeFillColor!;
      paint.style = PaintingStyle.fill;
      final double radius = _animateFillColor ? _radius * position.value : _radius;
      _shape.when(
        circle: () {
          canvas.drawCircle(center, radius, paint);
        },
      );
    }

    // draws the inner dot....
    // Draw the inner dot (only when active)
    if (!position.isDismissed && _dotColor != null) {
      paint.color = _dotColor!;
      paint.style = PaintingStyle.fill;
      _dotStyle.when(
        circle: () {
          _drawAnimatedCircle(center, canvas, paint);
        },
      );
    }
  }

  void _drawAnimatedCircle(Offset center, Canvas canvas, Paint paint) {
    final double currentDotRadius = _dotRadius * position.value;
    canvas.drawCircle(center, currentDotRadius, paint);
  }

  void _drawOuterCircleShape(Offset center, Canvas canvas, Paint paint) {
    canvas.drawCircle(center, _radius, paint);
  }

}

typedef EmptyCallback = void Function();

sealed class RadioShape {
  const RadioShape();
  const factory RadioShape.circle() = CircleShape;
  void when({
    required EmptyCallback circle,
  });
}

class CircleShape extends RadioShape {
  const CircleShape();

  @override
  void when({
    required EmptyCallback circle,
  }) =>
      circle();
}

sealed class DotStyle {
  const DotStyle();
  const factory DotStyle.circle() = CircleStyle;
  void when({
    required EmptyCallback circle,
  });
}

class CircleStyle extends DotStyle {
  const CircleStyle();

  @override
  void when({
    required EmptyCallback circle,
  }) =>
      circle();
}
