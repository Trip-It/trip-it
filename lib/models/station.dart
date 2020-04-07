import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:trip_it_app/models/location.dart';

class ChargingStation extends Location {
  String _host;
  String _operator;
  String _brand;
  String _address;
  int _numberOfCharge;
  String _id;
  double _maxPower;
  String _type;
  String _cost;
  String _openingTime;

  ChargingStation(
      double lat,
      double lon,
      String host,
      String operator,
      String brand,
      String address,
      int numberOfCharge,
      String id,
      double maxPower,
      String type,
      String cost,
      String openingTime)
      : this._host = host,
        this._operator = operator,
        this._brand = brand,
        this._address = address,
        this._numberOfCharge = numberOfCharge,
        this._id = id,
        this._maxPower = maxPower,
        this._type = type,
        this._cost = cost,
        this._openingTime = openingTime,
        super(host, type, lat, lon);

  // Getter

  String getHost(){
    return this._host;
  }

  String getOperator(){
    return this._operator;
  }

  String getBrand(){
    return this._brand;
  }

  String getAddress(){
    return this._address;
  }

  int getNumberOfCharge(){
    return this._numberOfCharge;
  }

  String getId(){
    return this._id;
  }

  double getMaxPower(){
    return this._maxPower;
  }

  String getType(){
    return this._type;
  }

  String getCost(){
    return this._cost;
  }

  String getOpeningTime(){
    return this._openingTime;
  }

  // Setter

  void setHost(String host){
    this._host = host;
  }

  void setOperator(String operator){
    this._operator = operator;
  }

  void setBrand(String brand){
    this._brand = brand;
  }

  void setAddress(String address){
    this._address = address;
  }

  void setNumberOfCharge(int numberOfCharge){
    this._numberOfCharge = numberOfCharge;
  }

  void setId(String id){
    this._id = id;
  }

  void setMaxPower(double maxPower){
    this._maxPower = maxPower;
  }

  void setType(String type){
    this._type = type;
  }

  void setCost(String cost){
    this._cost = cost;
  }

  void setOpeningTime(String openingTime){
    this._openingTime = openingTime;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["longitude"] = this.getLon();
    map["latitude"] = this.getLat();
    map["amenageur"] = _host;
    map["operateur"] = _operator;
    map["enseigne"] = _brand;
    map["addresse"] = _address;
    map["nbre_pdc"] = _numberOfCharge;
    map["id_station"]= _id;
    map["puiss_max"] = _maxPower;
    map["type_prise"] = _type;
    map["access_recharge"] = _cost;
    map["accessibilite"] = _openingTime;
    return map;
  }

  String toString() {
    return "ChargingStation\n Lon: " + this.getLon().toString() + "\n Lat: " + this.getLat().toString() + "\n Host: " + _host +"\n Operator: " + _operator +
        "\n Brand: " + _brand + "\n Address: " + _address + "\n Number of Charge: " + _numberOfCharge.toString() + "\n ID: " + _id +
        "\n Maximum power: " + _maxPower.toString() + "\n Type: " + _type + "\n Cost: " + _cost + "\n Opening Time: " + _openingTime;
  }

}
