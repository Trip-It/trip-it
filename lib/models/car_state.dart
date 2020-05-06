import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/obd_service.dart';

/// class to represent the real status of the Car by translation of the obd raw data

class CarState{
  int id;
  int speed;
  int soc;
  int soh;

  CarState(this.id, this.speed, this.soc, this.soh);

  void toCarState(ObdService obdService) {
    //input translation code --> services/ObdDataInterpreter
    obdService = null;
  }

  String toString(){
    return "State " + id.toString()+ " of the car is: " "Speed: " + speed.toString() + ", " + "State of Charge: " + soc.toString() + ", " + "State of Health" + soh.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'speed' : speed,
      'SoC' : soc,
      'SoH' : soh,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = map['id'];
    speed = map['speed'];
    soc = map['SoC'];
    soh = map['SoH'];
  }
}