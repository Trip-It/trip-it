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
  static final String SID_RealSoC                          = "7bb.6103.192";
  static final String SID_SOH                              = "7ec.623206.24";
  static final String SID_RealSpeed                        = "5d7.0";  //ESC-ABS

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
      List<BluetoothService> filteredServices=new List<BluetoothService>();
      // use necessary SIDs from protocol to filter retrieved data from OBD in order to get only the necessary data for car state
      for (BluetoothService service in services) {

        if (service.uuid.toString()==SID_RealSoC) { filteredServices.add(service);}
        if (service.uuid.toString()==SID_SOH) {filteredServices.add(service);}
        if (service.uuid.toString()==SID_RealSpeed) {filteredServices.add(service);}

      }

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