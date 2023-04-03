part of 'render_widgets.dart';

class WaterPainter extends CustomPainter {
  final Color waveColor;
  final double waveAnimation;


  WaterPainter(this.waveAnimation, {required this.waveColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i,
          sin((i / size.width * 2 * pi) + (waveAnimation * 2 * pi)) * 4);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    Paint paint = Paint()..color = waveColor;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}