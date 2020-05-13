import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:trip_it_app/models/protocol.dart';
import '../models/car_state.dart';
import '../models/car_state.dart';
import '../models/obd_service.dart';


class ObdDataInterpreter {

//  String carName;
//  Car carModel;
  Protocol carProtocol;
  ObdDataInterpreter();

  chooseProtocol(String carName){
    switch(carName){
      case "Zoe R110 52kWh":
        carProtocol = null; //assign protocol typ Zoe R110 52kWh
        break;
      case "Zoe R90 41kWh":
        carProtocol = null; //assign protocol typ Zoe R90 41kWh
        break;
      case "Kia EV 27":
        carProtocol = null; //assign protocol typ Kia EV 27
        break;
      case "Zoe R90 22kWh":
        carProtocol = null; //assign protocol typ Zoe R90 22kWh
        break;
    }}

    List<BluetoothService> filterServices(List<BluetoothService> services){
    // use necessary SIDs from protocol to filter retrieved data from OBD in order to get only the necessary data for car state
    }

  CarState translateService(ObdService obdService, Protocol protocol){
  CarState carState;
  carState.time = null;
  carState.speed = null;
  carState.soc = null;
  carState.soh = null;
  return carState;
  }
}