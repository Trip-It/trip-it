import 'package:flutter_blue/flutter_blue.dart';

//class for saving retrieved service including its UUID and characteristic
class ObdService {
  int id;
  var uuid;
//
  List<BluetoothCharacteristic> characteristics;
  final String tableService = "tableSerivce";
  final String columnID = "ID";
  final String columnUUID = "UUID";
  final String columnCharacteristic = "Characteristic";

  //each characteristic has multiple descriptors
  //  List<BluetoothDescriptor> descriptors;

  ObdService({this.id, this.uuid, this.characteristics});

  Map<String, dynamic> toMap() {
    return {
      'ID' : id,
      'UUID' : uuid,
//    'service' : service,
      'characteristics' : characteristics,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    uuid = map['UUID'];
//    service = map['service'];
    characteristics = map['characteristics'];
  }
}