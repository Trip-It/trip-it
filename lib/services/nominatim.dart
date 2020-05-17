///
///  License
///  Apache License 2.0
///  Copyright (c) 2020 Aliati Sotware, Lucas Finoti and João Pedro Martins
///

import 'package:http/http.dart' as http;
import 'dart:convert';

class NominatimService {

  /// Method to get information and coordinates of a given place/address ([address])
  Future<List<Map>> getAddressLatLng(String address) async {
    var url =
        "https://nominatim.openstreetmap.org/search?q=${address.replaceAll(RegExp(' '), '+')}&format=json&addressdetails=1";
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List addresses = jsonDecode(response.body);
    List<Map> share = List<Map>();
    for (Map ad in addresses) {
      share.add({
        'lat': ad['lat'],
        'lng': ad['lon'],
        'description': ad['display_name'],
        'state': ad['address']['state'] == null ? "na" : ad['address']['state'],
        'city': ad['address']['city'] == null ? "na" : ad['address']['city'],
        'suburb':
        ad['address']['suburb'] == null ? "na" : ad['address']['suburb'],
        'neighbourhood': ad['address']['neighbourhood'] == null
            ? "na"
            : ad['address']['neighbourhood'],
        'road': ad['address']['road'] == null ? "na" : ad['address']['road'],
      });
    }
    return share;
  }


  /// Reverse geocding method, getting an address and information by using
  /// coordinates ([lat],[lng])for the request
  Future<List<Map>> reverseGeocoding(double lat, double lng) async {
    var url =
        "https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&addressdetails=1";
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> addresses = jsonDecode(response.body);

    print(addresses.toString());


    List<Map> share = List<Map>();
    share.add({
      'lat': addresses['lat'],
      'lng': addresses['lon'],
      'description': addresses['display_name'],
      'state': addresses['address']['state'] == null ? "na" : addresses['address']['state'],
      'city': addresses['address']['city'] == null ? "na" : addresses['address']['city'],
      'suburb':
      addresses['address']['suburb'] == null ? "na" : addresses['address']['suburb'],
      'neighbourhood': addresses['address']['neighbourhood'] == null
          ? "na"
          : addresses['address']['neighbourhood'],
      'road': addresses['address']['road'] == null ? "na" : addresses['address']['road'],
    });


    return share;
  }

}
