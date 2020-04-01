library org.tripplanner.cars;

import 'java.dart';

class KiaSoul27 with Car
{
  static final double carWeight = 1580;
  static final double scx = 0.81;
  static final double battery = 22000;
  static final double crr = 0.0136;
  static final double lights = 105;
  static final List<double> clim = new List<double>.from([1300, 620, 520, 200, 0, 500]);
  static final List<Integer> TEMPERATURE = new List<Integer>.from([0, 5, 10, 15, 20, 25]);
  static final List<double> EFFICIENCY = [0.72, 0.72, 0.72, 0.75, 0.78, 0.82, 0.85, 0.85, 0.85, 0.85, 0.85];
  static final List<Integer> SPEEDS = [30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130];

  double getBattery()
  {
    return battery;
  }

  String getName()
  {
    return "Kia EV 27";
  }

  double getWeight()
  {
    return carWeight;
  }

  double getSCx()
  {
    return scx;
  }

  double getCrr()
  {
    return crr;
  }

  double getLights()
  {
    return lights;
  }

  double getClim(int temp)
  {
    int index = Util.getAmong(TEMPERATURE, temp);
    return clim[index];
  }

  double getEfficiency(int speed)
  {
    int index = Util.getAmong(SPEEDS, speed);
    return EFFICIENCY[index];
  }
}