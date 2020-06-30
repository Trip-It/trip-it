import 'dart:core';

import 'package:trip_it_app/models/car.dart';
import 'package:trip_it_app/models/profile.dart';

/// Class holding information about the trip regarding the [carType], [initialSoC],
/// [energyLowLimit], [energyRefill], [numberOfPersons], [externalTemp], [maxSpeed],
/// whether or not [chargingTimeIncluded] as well as [lights] and/or [climOrHeat]
/// is being used
class DrivingContext{
  String carType;
  int initialSoC = 100;
  int energyLowLimit = 10;
  int energyRefill = 90;
  int numberOfPersons = 2;
  int externalTemp = 20;
  int maxSpeed = 130;
  bool chargingTimeIncluded = false;
  bool lights = false;
  bool climOrHeat= false;

  /// Constructor using a profile
  DrivingContext(Profile profile){
    this.carType = profile.getCar();
    this.energyLowLimit = profile.getMinimumCharge();
    this.energyRefill = profile.getMaximumCharge();
  }


  String getCarType() {
    return this.carType;
  }

  void setCarType(String carType) {
    this.carType = carType;
  }

  int getInitialSoC() {
    return this.initialSoC;
  }

  void setInitialSoc(int initialSoC) {
    this.initialSoC = initialSoC;
  }

  int getEnergyLowLimit() {
    return this.energyLowLimit;
  }

  void setEnergyLowLimit(int energyLowLimit) {
    this.energyLowLimit = energyLowLimit;
  }

  int getEnergyRefill() {
    return this.energyRefill;
  }

  void setEnergyRefill(int energyRefill) {
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