// network_helper.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<Map<String, dynamic>> getData1(String cityName, String apiKey) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      // Handle the data here as needed
    } else {
      print(response.statusCode);
      return {};
    }
  }

  Future<Map<String, dynamic>> getData(
      double latitude, double longitude, String apiKey) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': apiKey,
      'units': 'metric', // Add the 'units' parameter for metric units
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      // Handle the data here as needed
    } else {
      print(response.statusCode);
      return {};
    }
  }
}
