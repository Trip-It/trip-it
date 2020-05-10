import 'package:trip_it_app/models/sid.dart';

abstract class Protocol{
  String getName();
  List<SID> getSIDs();
}