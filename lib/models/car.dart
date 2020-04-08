/// Class representing a car with it's physical properties
abstract class Car
{
  String getName();

  double getWeight();

  double getSCx();

  double getCrr();

  double getBattery();

  double getLights();

  double getClim(int temp);

  double getEfficiency(int speed);
}