enum Activity {
  sedentary(0.0),
  lightly(0.2),
  moderately(0.4),
  very(0.6),
  extremely(0.8);

  final double factor;

  const Activity(this.factor);
}

enum Climate {
  temperate(0),
  hotAndDry(0.5),
  hotAndHumid(1),
  cold(0.25);

  final double factor;

  const Climate(this.factor);
}

enum HeightMetrics {
  feet,
  cm
}

enum WeightMetrics {
  kg,
  lbs
}

class WaterIntakeCalc {

  /// The height in cm.
  final double height;

  /// The weight in kg.
  final double weight;

  /// The activity.
  final Activity activity;

  /// The climate.
  final Climate climate;

  WaterIntakeCalc({
    required this.height,
    required this.weight,
    required this.activity,
    required this.climate,
  });

  /// To get the water intake required.
  double getWaterIntake() {
    return (weight * 0.03) + (height * 0.04) + (activity.factor * 0.2) + climate.factor;
  }

  /// Pound to Kg.
  double poundToKg(double pound) {
    return pound * 0.45;
  }

  /// Kg to pound.
  double kgToPound(double kg) {
    return kg * 2.2;
  }

  /// Feet to cm.
  double feetToCm(double feet) {
    return feet * 30.48;
  }

  /// Cm to feet.
  double cmToFeet(double cm) {
    return cm * 0.033;
  }

  /// Inch to feet.
  double inchToFeet(double inch) {
    return inch * 0.0833333;
  }

}
