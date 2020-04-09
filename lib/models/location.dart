///
/// Class modeling a location with coordinates [lat] and [lon] as well as a
/// [title] and a [subtitle] which can be used in combination with a marker
///
class Location{
  String _title = '';
  String _subtitle = '';
  double _lat = 0.0;
  double _lon = 0.0;

  /// Constructor specifying  [_title], [_subtitle], [_lat] and [_lon] of the position
  Location(this._title, this._subtitle, this._lat,this._lon);

  //Getter

  String getTitle(){
    return this._title;
  }

  String getSubtitle(){
    return this._subtitle;
  }

  double getLat(){
    return this._lat;
  }

  double getLon(){
    return this._lon;
  }

  //Setter

  void setTitle(String title){
    this._title = title;
  }

  void setSubtitle(String subtitle){
    this._subtitle = subtitle;
  }

  void setLat(double lat){
    this._lat = lat;
  }

  void setLon(double lon){
    this._lon = lon;
  }


  String toString() {
    return "Title: " + this._title + "\nSubtitle: " + this._subtitle + "\nLat: " + this._lat.toString() +"\nLon: " + this._lon.toString();
  }


}