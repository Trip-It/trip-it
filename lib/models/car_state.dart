import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/obd_service.dart';

/// class to represent the real status of the Car by translation of the obd raw data

class CarState{
  String time;
  int speed;
  int soc;
  int soh;

  CarState(this.time, this.speed, this.soc, this.soh);

  void toCarState(ObdService obdService) {
    //input translation code --> services/ObdDataInterpreter
    obdService = null;
  }

  String toString(){
    return "State at the time " + time + " of the car is: " "Speed: " + speed.toString() + ", " + "State of Charge: " + soc.toString() + ", " + "State of Health" + soh.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'time' : time,
      'speed' : speed,
      'SoC' : soc,
      'SoH' : soh,
    };
  }

  fromMap(Map<String, dynamic> map) {
    time = map['time'];
    speed = map['speed'];
    soc = map['SoC'];
    soh = map['SoH'];
  }
}