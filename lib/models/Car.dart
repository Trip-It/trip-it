library org.tripplanner.cars;

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