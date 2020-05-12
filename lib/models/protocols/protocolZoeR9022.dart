import 'package:trip_it_app/models/protocol.dart';
import 'package:trip_it_app/models/sid.dart';

class ProtocolZoeR9022 implements Protocol{

  static final name ='ProtocolZoeR9022';
  static List<SID> listSIDs = [new SID("sidAvailableDistance", "654.42"), new SID("sidAvailableEnergy", "427.49"), new SID("sidAverageConsumption", "654.52"),new SID("sidWorstAverageConsumption", "62d.0"), new SID("sidBestAverageConsumption", "62d.10")];

  // static final String sidAvailableDistance = "654.42";
  // static final String sidAvailableEnergy = "427.49";
  // static final String sidAverageConsumption = "654.52";
  // static final String sidWorstAverageConsumption = "62d.0";
  // static final String sidBestAverageConsumption = "62d.10";

  @override
  String getName() {
    return name;
  }

  @override
  List<SID> getSIDs() {
    return listSIDs;
  }

}