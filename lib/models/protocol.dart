import 'package:trip_it_app/models/sid.dart';

class Protocol{

  String name;
  List<SID> listSIDs;

  Protocol(String _name, List<SID> _listSIDs){
    name = _name;
    listSIDs = _listSIDs;
  }

  String getName() {
    return name;
  }

  List<SID> getSIDs(){
    return listSIDs;
  }

///Available SIDs for Renault ZOE to be used for filtering the data
// RangeActivity
// static final String sidAvailableDistance = "654.42";
// static final String sidAvailableEnergy = "427.49";
// static final String sidAverageConsumption = "654.52";
// static final String sidWorstAverageConsumption = "62d.0";
// static final String sidBestAverageConsumption = "62d.10";
// ChargingActivity
// static final String SID_MaxCharge                        = "7bb.6101.336";
// static final String SID_UserSoC                          = "42e.0";
// static final String SID_RealSoC                          = "7bb.6103.192";
// static final String SID_AvChargingPower                  = "427.40";
// static final String SID_HvTemp                           = "42e.44";
// static final String SID_RangeEstimate                    = "654.42";
// static final String SID_DcPower                          = "800.6103.24"; // Virtual field
// static final String SID_SOH                              = "7ec.623206.24";
// AuxBattTechActivity
// static final String SID_AuxVoltage                       = "7ec.622005.24"; //"7bb.6101.224";
// static final String SID_AuxStatus                        = "638.37";
// static final String SID_VehicleState                     = "35c.5";
// static final String SID_ChargingStatusDisplay            = "65b.41"; might not work!
// static final String SID_VoltageUnderLoad                 = "7ec.623485.24"; // Voltage measurement given by BCS Battery Current Sensor
// static final String SID_CurrentUnderLoad                 = "7ec.623484.24"; // Current measurement given by BCS Battery Current Sensor
// Breaking activity
// static final String SID_TotalPotentialResistiveWheelsTorque  = "1f8.16"; // UBP 10ms
// static final String SID_FrictionTorque                       = "800.6101.24";
// static final String SID_ElecBrakeTorque                      = "800.610a.24";
// ChargingHistActivity
// static final String SID_Preamble_KM                      = "7ec.6233d4."; // 240 - 24
// static final String SID_Preamble_END                     = "7ec.6233d5."; //  96 -  8
// static final String SID_Preamble_TYP                     = "7ec.6233d6."; //  96 -  8
// static final String SID_Preamble_SOC                     = "7ec.6233d7."; // 168 - 16
// static final String SID_Preamble_TMP                     = "7ec.6233d8."; //  96 -  8
// static final String SID_Preamble_DUR                     = "7ec.6233d9."; // 168 - 16
// static final String SID_Total_kWh                        = "7bb.6161.120";
// static final String SID_Counter_Full                     = "7bb.6166.48";
// static final String SID_Counter_Partial                  = "7bb.6166.64";
// ClimaTechActivity
// static final String SID_EngineFanSpeed                   = "42e.20";
// static final String SID_DcPower                          = "800.6109.24";
// private static final String SID_ChargingPower                    = "42e.56"; Might not work!
// static final String SID_HvCoolingState                   = "430.38";
// static final String SID_HvEvaporationTemp                = "430.40";
// static final String SID_ClimaCompressorPower             = "7ec.6233A7.24"; Might not work!
// static final String SID_Pressure                         = "764.6143.134";
// static final String SID_BatteryConditioningMode          = "432.36";
// static final String SID_ClimaLoopMode                    = "42a.48";
// static final String SID_PtcRelay1                        = "7ec.623498.31"; Might not work!
// static final String SID_PtcRelay2                        = "7ec.62349a.31"; Might not work!
// static final String SID_PtcRelay3                        = "7ec.62349c.31"; Might not work!
// Consumption activity
// static final String SID_TotalPositiveTorque = "800.610b.24";
// static final String SID_TotalNegativeTorque = "800.610c.24";
// static final String SID_TotalPotentialResistiveWheelsTorque  = "1f8.16"; //UBP 10ms
// static final String SID_Instant_Consumption                  = "800.6100.24";
// DrivingActivity
// static final String SID_DcPower = "800.6109.24"; // "1fd.48"; //EVC
// static final String SID_Pedal = "186.40"; //EVC
// static final String SID_TotalPositiveTorque = "800.610b.24";
// static final String SID_RealSpeed = "5d7.0";  //ESC-ABS
// static final String SID_SoC = "42e.0"; //EVC
// static final String SID_RangeEstimate = "654.42"; //EVC
// static final String SID_TotalNegativeTorque = "800.610c.24";
// static final String SID_TotalPotentialResistiveWheelsTorque = "1f8.16"; //UBP 10ms
// SpeedControlActivity
// static final String SID_Odometer = "7ec.6233de.24";
// static final String SID_RealSpeed = "5d7.0";  //ESC-ABS


}