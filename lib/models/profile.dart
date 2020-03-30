/// Class defining a profile
class Profile {
  // Fields
  String name;
  String picture;
  String car;
  int minimumCharge;
  int maximumCharge;
  bool restaurant;
  bool cinema;
  bool sport;
  bool plug;
  String language;
  String mapType;

  Profile(this.name, this.picture, this.car, this.minimumCharge, this.maximumCharge, this.restaurant, this.cinema, this.sport, this.plug, this.language, this.mapType);

  // Getter
  String getName() {
    return this.name;
  }

  String getPicture() {
    return this.picture;
  }

  String getCar() {
    return this.car;
  }

  int getMinimumCharge() {
    return this.minimumCharge;
  }

  int getMaximumCharge() {
    return this.maximumCharge;
  }

  bool getRestaurant() {
    return this.restaurant;
  }

  bool getCinema() {
    return this.cinema;
  }

  bool getSport() {
    return this.sport;
  }

  String getLanguage() {
    return this.language;
  }

  String getMapType() {
    return this.mapType;
  }

  // Setter
  void setName(String name){
    this.name = name;
  }

  void setPicture(String picture){
    this.picture = picture;
  }

  void setCar(String car){
    this.car = car;
  }

  void setMinimumCharge(int minimumCharge){
    this.minimumCharge = minimumCharge;
  }

  void setMaximumCharge(int maximumCharge){
    this.maximumCharge = maximumCharge;
  }

  void setRestaurant(bool restaurant){
    this.restaurant = restaurant;
  }

  void setCinema(bool cinema){
    this.cinema = cinema;
  }

  void setSport(bool sport){
    this.sport = sport;
  }

  void setPlug(bool plug){
    this.plug = plug;
  }

  void setLanguage(String language){
    this.language = language;
  }

  void setMapType(String mapType){
    this.mapType = mapType;
  }

}
