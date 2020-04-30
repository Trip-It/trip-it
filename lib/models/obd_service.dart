import 'package:flutter_blue/flutter_blue.dart';


///class for saving raw obd data(service uuid, characteristics-uuids)
//each characteristic has multiple descriptors

class ObdService {
  Guid uuid; //typ: Guid
  List<Guid> uuidChars; //UUID of characteristics

  ObdService({this.uuid,this.uuidChars});

  fillObdService(BluetoothService service){
    uuid = service.uuid;
    for (var i=0; i <= service.characteristics.length; i++) {
      uuidChars[i] = service.characteristics[i].uuid;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'UUID' : uuid,
//    'service' : service,
      'UUID_characteristics' : uuidChars,
    };
  }

  fromMap(Map<String, dynamic> map) {
    uuid = map['UUID'];
//    service = map['service'];
    uuidChars = map['characteristics'];
  }

}