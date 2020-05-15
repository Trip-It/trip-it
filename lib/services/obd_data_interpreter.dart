import 'package:flutter_blue/flutter_blue.dart';
import 'package:trip_it_app/models/car_state.dart';
import 'package:trip_it_app/models/cars/renault_zoe_r90_22.dart';
import 'package:trip_it_app/models/obd_service.dart';
import 'package:trip_it_app/models/protocol.dart';
import 'package:trip_it_app/models/sid.dart';
import '../models/car_state.dart';
import '../models/car_state.dart';
import '../models/obd_service.dart';
import 'package:trip_it_app/models/protocols/protocolZoeR9022.dart';

class ObdDataInterpreter {
//  String carName;
//  Car carModel;
  Protocol carProtocol;
  List<BluetoothService> filteredServices;

  ObdDataInterpreter() {
    carProtocol = null;
    filteredServices = null;
  }

//  static final String SID_RealSoC                          = "7bb.6103.192";
//  static final String SID_SOH                              = "7ec.623206.24";
//  static final String SID_RealSpeed                        = "5d7.0";  //ESC-ABS

  void changeProtocol(Protocol protocol) {
    carProtocol = protocol;
    filteredServices = null;
  }

  chooseProtocol(String carName) {
    switch (carName) {
      case "Zoe R110 52kWh":
        filteredServices = null;
        carProtocol = null; //assign protocol typ Zoe R110 52kWh
        break;
      case "Zoe R90 41kWh":
        filteredServices = null;
        carProtocol = null; //assign protocol typ Zoe R90 41kWh
        break;
      case "Kia EV 27":
        filteredServices = null;
        carProtocol = null; //assign protocol typ Kia EV 27
        break;
      case "Zoe R90 22kWh":
        filteredServices = null;
        carProtocol = null; //ProtocolZoeR9022; //assign protocol typ Zoe R90 22kWh
        //eventually need to change ProtocolZoeR9022 as class of Protocol
        break;
    }
  }

  filterServices(List<BluetoothService> services) {
    filteredServices = null;
    List<SID> sids = carProtocol.getSIDs();
//      List<BluetoothService> filteredServices=new List<BluetoothService>();

    // use necessary SIDs from protocol to filter retrieved data from OBD in order to get only the necessary data for car state
    for (BluetoothService service in services)
      for (SID sid in sids) {
        if (service.uuid.toString() == sid.value) {
          filteredServices.add(service);
        }
      }

    CarState translateService(
        List<BluetoothService> services, Protocol protocol) {
      CarState carState;
      carState.time = null;
      carState.speed = null;
      carState.soc = null;
      carState.soh = null;
      return carState;
    }
  }
}
