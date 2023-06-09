part of 'constants.dart';

class DecorationC {
  /// BoxDecoration with rounded top or bottom corners.
  static BoxDecoration boxDecorTB(bool top, {required double radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: top ? Radius.circular(radius) : Radius.zero,
          topLeft: top ? Radius.circular(radius) : Radius.zero,
          bottomRight: !top ? Radius.circular(radius) : Radius.zero,
          bottomLeft: !top ? Radius.circular(radius) : Radius.zero),
    );
  }

  /// BoxDecoration with rounded corners.
  static BoxDecoration boxDecorAll({required double radius}) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  /// Gives rounded border radius. Passed to [borderRadius].
  static BorderRadius roundedBorderRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  /// Gives circle shape to the widget.
  static const BoxDecoration circleShape =
  BoxDecoration(shape: BoxShape.circle);

  /// Gives rounded border to top of a widget. Is passed to parameter [ShapeBorder].
  static const RoundedRectangleBorder roundedRectangleBorderTop =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10.0),
      topLeft: Radius.circular(10.0),
    ),
  );

  /// Gives rounded border to bottom of a widget. Is passed to parameter [ShapeBorder].
  static const RoundedRectangleBorder roundedRectangleBorderBottom =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(10.0),
    ),
  );

  /// Gives rounded border to a widget. Is passed to parameter [ShapeBorder].
  static const RoundedRectangleBorder roundedRectangleBorder =
  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}