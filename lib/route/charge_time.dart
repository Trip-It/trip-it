/// Class which is being used to calculate the charging time
class ChargeTime{

  static List charge22 = new List.of([0, 19, 38, 61, 85, 98, 111, 160]);
  static List charge11 = new List.of([0, 37, 75, 125, 175, 200, 228, 270]);
  static List charge4 = new List.of([0, 127, 252, 455, 630, 731, 807, 900]);
  static List charge2 = new List.of([0, 225, 450, 750, 1070, 1200, 1318, 1500]);
  static List percent = new List.of([0.0, 0.15, 0.3, 0.5, 0.7, 0.8, 0.9, 1.0]);

  /// Method to calculate the estimated charging time given the [initialCharge]
  /// and the [endCharge]
  static double getChargeTime(double initialCharge, double endCharge) {
    double toEnd = interpolate(percent, charge22, endCharge);
    double toStart = interpolate(percent, charge22, initialCharge);
    return toEnd - toStart;
  }

  /// Interpolation method used to estimate the charging time
  static double interpolate(List abs, List ord, double value) {

    if (value <= abs[0]) {
      return ord[0];
    } else if (value > abs[abs.length - 1]) {
      return ord[abs.length - 1];
    } else {

      int i;
      for(i = 0; value > abs[i]; ++i) {
      }
      double alpha = (value - abs[i - 1]) / (abs[i] - abs[i - 1]);
      return alpha * (ord[i] - ord[i - 1]) + ord[i - 1];

    }
  }

}