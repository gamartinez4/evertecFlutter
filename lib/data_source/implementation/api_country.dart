import 'dart:convert';
import 'package:ceiba_flutter/data_source/interface/i_api_country.dart';

import '../../entities/country_data.dart';
import 'package:http/http.dart' as http;


class ApiCountry implements IApiCountry{

  Future<CountryData> countryDataRequest() async{
    final url = Uri.parse('https://api.covidtracking.com/v1/us/current.json');
      final response = await http.get(url);

      if (response.statusCode == 200) {
     
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return CountryData.fromJson(data[0]);
        } else {
          throw Exception('No data found');
        }
      } else {
        throw Exception('Failed to load country data');
      }
  }
}