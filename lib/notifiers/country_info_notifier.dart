
import 'package:flutter/material.dart';

import '../data_source/interface/i_api_country.dart';
import '../entities/country_data.dart';

class CountryInfoNotifier extends ChangeNotifier{
  
  final IApiCountry _apiCountry;

  CountryInfoNotifier(this._apiCountry);

  CountryData _countryData = CountryData();
  CountryData get countryData => _countryData;
  
  void _setCountryData(CountryData countryData){
    _countryData = countryData;
    notifyListeners();
  }

  Future<void> retriveCountryData() async =>
      _setCountryData( await _apiCountry.countryDataRequest());
    
}