import 'package:trip_it_app/models/car.dart';

/// Class giving the physical properties of a Renault Zoe R90 41kWh
class RenaultZoeR90_41 implements Car
{
  static final double carWeight = 1300.0;
  static final double scx = 0.75;
  static final double battery = 22000.0;
  static final double crr = 0.011;
  static final double lights = 105.0;
  static final List<double> clim = new List<double>.from([1300.0, 620.0, 520.0, 200.0, 0.0, 500.0]);
  static final List<int> TEMPERATURE = new List<int>.from([0, 5, 10, 15, 20, 25]);
  static final List<double> EFFICIENCY = [0.72, 0.72, 0.72, 0.75, 0.78, 0.82, 0.85, 0.85, 0.85, 0.85, 0.85];
  static final List<int> SPEEDS = [30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130];
  static const String NAME = "Zoe R90 41kWh";

  double getBattery()
  {
    return battery;
  }

  String getName()
  {
    return NAME;
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
    int index = TEMPERATURE.indexOf(temp);
    return clim[index];
  }

  double getEfficiency(int speed)
  {
    int index = SPEEDS.indexOf(speed);
    return EFFICIENCY[index];
  }
}