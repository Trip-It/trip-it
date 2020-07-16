import 'dart:developer';
import 'dart:math';

import 'package:trip_it_app/models/car.dart';
import 'package:trip_it_app/models/cars/kia_soul_27.dart';
import 'package:trip_it_app/models/cars/renault_zoe_r110_52.dart';
import 'package:trip_it_app/models/cars/renault_zoe_r90_22.dart';
import 'package:trip_it_app/models/cars/renault_zoe_r90_41.dart';
import 'package:trip_it_app/route/driving_context.dart';
import 'package:latlong/latlong.dart';

/// Class which is being used to calculate the energy consumption on a given trip
class TripConsumption{

  DrivingContext dc;
  static final double _g = 9.81;
  double _tripConsumption = 0.0;
  List<double> _soc = new List<double>();
  List<double> _energyUsedSum = new List<double>();
  List waypoints;
  List steps;
  List elevation;
  List<LatLng> chargingPoints = new List<LatLng>();

  /// Constructor
  TripConsumption(this.dc, this.waypoints, this.steps, this.elevation);


  /// Getter methods
  List<double> getSoc(){ return this._soc;}

  List<double> getEnergyUsedSum(){ return this._energyUsedSum;}

  double getTripConsumption(){ return this._tripConsumption;}


  /// Method to calculate the state of charge of the battery throughout a trip
  void calculateSoc(){

    Car car = this.getCar();
    double battery = car.getBattery();
    double remainingEnergy = battery * this.dc.getInitialSoC();
    double weight = car.getWeight() + this.dc.getPersonsCount().toDouble() * 75.0;
    this._tripConsumption = 0.0;

    for(int i = 0; i < steps.length; i++){

      /// Calculate energy for this waypoint
      double energyUsed = calculateEnergy(car, weight, steps[i]);

      this._tripConsumption += energyUsed;
      this._energyUsedSum.add(this._tripConsumption);

      /// Check if consumption would exceed battery SoC
      if(remainingEnergy - energyUsed < this.dc.getEnergyLowLimit() * battery){
        remainingEnergy = battery * this.dc.getEnergyRefill() - energyUsed;
        /// Set this waypoint as new point to charge
        chargingPoints.add(waypoints[i]);
      } else {
        remainingEnergy -= energyUsed;
      }

      this._soc.add(remainingEnergy);

    }
  }


  /// Method to calculate the energy needed between two waypoints, given the
  /// [car] that is being used as well the total [weight] of the vehicle
  double calculateEnergy(Car car, double weight, Map step){
    double speed = step['distance'] / step['duration'];        /// Speed for the step in m/s
    double elevationNow = elevation[step['way_points'][1]];    /// Elevation of the next waypoint
    double elevationLast = elevation[step['way_points'][0]];   /// Elevation of last waypoint
    double distance = step['distance'];                        /// Distance between the two waypoints

    /// If distance is negligible an energy consumption of zero is being assumed
    if(distance < 0.0001){
      return 0.0;
    } else {

      double slope = (elevationNow - elevationLast) / distance;
      double rollingP = speed / 3.6 * (weight * _g * slope + weight * _g * car.getCrr() * sqrt(1.0 - slope  * slope));
      double aeroP = speed / 3.6 * speed / 3.6 * speed / 3.6 * 0.5 * this.getRho() * car.getSCx();
      double time = distance / 1000.0 / speed;
      double energy = (rollingP + aeroP) / car.getEfficiency(speed.toInt()) * time;

      /// Take the energy consumption of the light into account
      if(this.dc.isLights()){
        energy += time * car.getLights();
      }

      /// Take air conditioning into account
      if(this.dc.isClimOrHeat()){
        energy += time * car.getClim(this.dc.externalTemp);
      }

      return energy;
    }
  }


  /// Method to calculate the volume mass of the surrounding air according to
  /// the current external temperature
  double getRho() {
    return -0.0043 * this.dc.getExternalTemp().toDouble() + 1.293;
  }


  /// Method to retrieve the car matching the saved car name
  Car getCar(){

    switch(this.dc.getCarType()){

      case KiaSoul27.NAME: return KiaSoul27();
      case RenaultZoeR90_22.NAME : return RenaultZoeR90_22();
      case RenaultZoeR90_41.NAME : return RenaultZoeR90_41();
      case RenaultZoeR110_52.NAME : return RenaultZoeR110_52();
      default: return RenaultZoeR90_41();

    }
  }

}