/// Class defining a profile
class Profile {
  // Fields
  String _name;
  String _picture;
  String _car;
  int _minimumCharge;
  int _maximumCharge;
  int _restaurant;
  int _cinema;
  int _sport;
  int _plug;
  String _language;
  String _mapType;

  Profile(this._name, this._picture, this._car, this._minimumCharge, this._maximumCharge, this._restaurant, this._cinema, this._sport, this._plug, this._language, this._mapType);

  // Getter
  String getName() {
    return this._name;
  }

  String getPicture() {
    return this._picture;
  }

  String getCar() {
    return this._car;
  }

  int getMinimumCharge() {
    return this._minimumCharge;
  }

  int getMaximumCharge() {
    return this._maximumCharge;
  }

  int getRestaurant() {
    return this._restaurant;
  }

  int getCinema() {
    return this._cinema;
  }

  int getSport() {
    return this._sport;
  }

  int getPlug() {
    return this._plug;
  }

  String getLanguage() {
    return this._language;
  }

  String getMapType() {
    return this._mapType;
  }

  // Setter
  void setName(String name){
    this._name = name;
  }

  void setPicture(String picture){
    this._picture = picture;
  }

  void setCar(String car){
    this._car = car;
  }

  void setMinimumCharge(int minimumCharge){
    this._minimumCharge = minimumCharge;
  }

  void setMaximumCharge(int maximumCharge){
    this._maximumCharge = maximumCharge;
  }

  void setRestaurant(int restaurant){
    this._restaurant = restaurant;
  }

  void setCinema(int cinema){
    this._cinema = cinema;
  }

  void setSport(int sport){
    this._sport = sport;
  }

  void setPlug(int plug){
    this._plug = plug;
  }

  void setLanguage(String language){
    this._language = language;
  }

  void setMapType(String mapType){
    this._mapType = mapType;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["picture"] = _picture;
    map["car"] = _car;
    map["minCharge"] = _minimumCharge;
    map["maxCharge"] = _maximumCharge;
    map["rest"]= _restaurant;
    map["cinema"] = _cinema;
    map["sport"] = _sport;
    map["plug"] = _plug;
    map["language"] = _language;
    map["mapType"] = _mapType;
    return map;
  }

  String toString() {
    return "Name: " + _name + "\nPicture: " + _picture + "\nCar: " + _car +"\nMinimum charge: " + _minimumCharge.toString() +
        "\nMaximum charge: " + _maximumCharge.toString() + "\nRestaurant: " + _restaurant.toString() + "\nCinema: " + _cinema.toString() +
        "\nSport: " + _sport.toString() + "\nPlug: " + _plug.toString() + "\nLanguage: " + _language + "\nMapType: " + _mapType;
  }
}
