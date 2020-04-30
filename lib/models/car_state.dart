import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/obd_service.dart';

/// class to represent the real status of the Car by translation of the obd raw data

class CarState{
  int speed;
  int soc;
  int soh;

  CarState(this.speed, this.soc, this.soh);

  void toCarState(ObdService obdService) {
    //input translation code --> services/ObdDataInterpreter
    obdService = null;
  }

  Map<String, dynamic> toMap() {
    return {
      'speed' : speed,
      'SoC' : soc,
      'SoH' : soh,
    };
  }

  fromMap(Map<String, dynamic> map) {
    speed = map['speed'];
    soc = map['SoC'];
    soh = map['SoH'];
  }
}