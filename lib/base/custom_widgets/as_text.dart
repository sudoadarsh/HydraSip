part of 'custom_widgets.dart';

class ASText extends StatelessWidget {
  const ASText({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.fontStyle, this.maxLines,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  /// Normal vs Italic.
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
