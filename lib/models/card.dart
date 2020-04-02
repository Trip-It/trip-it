///
/// Class modeling a card with its name [name] and its picture [image].
///
class ChargeCard {
  String name;
  String image;
  String url;

  ChargeCard(this.name, this.image, this.url);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["image"] = image;
    map["url"] = url;
    return map;
  }

  String toString() {
    return "Name: " + name + "\nImage: " + image + "\nURL: " + url ;
  }
}
