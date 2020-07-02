import 'dart:core';

import 'package:trip_it_app/models/car.dart';
import 'package:trip_it_app/models/profile.dart';

/// Class holding information about the trip regarding the [carType], [initialSoC],
/// [energyLowLimit], [energyRefill], [numberOfPersons], [externalTemp], [maxSpeed],
/// whether or not [chargingTimeIncluded] as well as [lights] and/or [climOrHeat]
/// is being used
class DrivingContext{
  String carType;
  double initialSoC = 1;
  double energyLowLimit = 0.1;
  double energyRefill = 0.9;
  int numberOfPersons = 2;
  int externalTemp = 20;
  int maxSpeed = 130;
  bool chargingTimeIncluded = false;
  bool lights = false;
  bool climOrHeat= false;

  /// Constructor using a profile
  DrivingContext(Profile profile){
    this.carType = profile.getCar();
    this.energyLowLimit = profile.getMinimumCharge()/100;
    this.energyRefill = profile.getMaximumCharge()/100;
  }


  String getCarType() {
    return this.carType;
  }

  void setCarType(String carType) {
    this.carType = carType;
  }

  double getInitialSoC() {
    return this.initialSoC;
  }

  void setInitialSoc(double initialSoC) {
    this.initialSoC = initialSoC;
  }

  double getEnergyLowLimit() {
    return this.energyLowLimit;
  }

  void setEnergyLowLimit(double energyLowLimit) {
    this.energyLowLimit = energyLowLimit;
  }

  double getEnergyRefill() {
    return this.energyRefill;
  }

  void setEnergyRefill(double energyRefill) {
    this.energyRefill = energyRefill;
  }

  int getPersonsCount() {
    return this.numberOfPersons;
  }

  void setPersonsCount(int personsCount) {
    this.numberOfPersons = personsCount;
  }

  int getExternalTemp() {
    return this.externalTemp;
  }

  void setExternalTemp(int externalTemp) {
    this.externalTemp = externalTemp;
  }

  bool isLights() {
    return this.lights;
  }

  void setLights(bool lights) {
    this.lights = lights;
  }

  bool isClimOrHeat() {
    return this.climOrHeat;
  }

  void setClimOrHeat(bool climOrHeat) {
    this.climOrHeat = climOrHeat;
  }

  int getMaximumSpeed() {
    return this.maxSpeed;
  }

  void setMaximumSpeed(int maximumSpeed) {
    this.maxSpeed = maximumSpeed;
  }

  bool isChargingTimeIncluded() {
    return this.chargingTimeIncluded;
  }

  void setChargingTimeIncluded(bool chargingTimeIncluded) {
    this.chargingTimeIncluded = chargingTimeIncluded;
  }
}