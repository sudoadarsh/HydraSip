import 'dart:math' as math;

enum Activity {
  sedentary(30),
  lightly(35),
  moderately(40),
  very(45),
  extremely(50);

  final double factor;

  const Activity(this.factor);
}

enum Climate {
  temperate(500),
  hotAndDry(1000),
  hotAndHumid(1500),
  cold(0);

  final double factor;

  const Climate(this.factor);
}

enum HeightMetrics { feet, cm }

enum WeightMetrics { kg, lbs }

class WaterIntakeCalc {
  /// Pound to Kg.
  static double poundToKg(double pound) {
    return pound * 0.45;
  }

  /// Kg to pound.
  static double kgToPound(double kg) {
    return kg * 2.2;
  }

  /// Feet to cm.
  static double feetToCm(double feet) {
    return feet * 30.48;
  }

  /// Cm to feet.
  static double cmToFeet(double cm) {
    return cm * 0.033;
  }

  /// Inch to feet.
  static double inchToFeet(double inch) {
    return inch * 0.0833333;
  }

  /// [height] in cm
  /// [weight] in kg
  static double bodySurfaceArea({
    required double height,
    required double weight,
  }) {
    return 0.007184  * math.pow(height, 0.725) * math.pow(weight, 0.425);
  }

  static double waterIntake({
    required double bsa,
    required int activity,
    required int climate,
  }) {
    return ((bsa * activity + climate) / 1000);
  }

  static int numberOfSip({required double liters}) {
    return ((liters * 1000) / 25).ceil();
  }
}
