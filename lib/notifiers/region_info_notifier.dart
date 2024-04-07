
import 'package:flutter/material.dart';

import '../data_source/api_regions.dart';
import '../entities/region_data.dart';


class RegionInfoNotifier extends ChangeNotifier{
  
  final ApiRegions _apiRegions;

  RegionInfoNotifier(this._apiRegions);

  final List<RegionData> _regionsData = [];
  List<RegionData> get regionsData => _regionsData;
  
  void _setRegionsData(List<RegionData> regionsData){
    regionsData = regionsData;
    notifyListeners();
  }

  Future<void> retriveRegionsData() async =>
      _setRegionsData( await _apiRegions.mapToEntity());
    
}