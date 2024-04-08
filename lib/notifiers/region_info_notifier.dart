
import 'package:flutter/material.dart';
import '../data_source/interface/i_api_regions.dart';
import '../entities/region_data.dart';


class RegionInfoNotifier extends ChangeNotifier{
  
  final IApiRegions _apiRegions;

  RegionInfoNotifier(this._apiRegions);

  List<RegionData> _regionsData = [];
  List<RegionData> get regionsData => _regionsData;
  
  void _setRegionsData(List<RegionData> regionsData){
    _regionsData = List<RegionData>.from(regionsData.map((e) => e));
    notifyListeners();
  }

  Future<void> retriveRegionsData() async =>
      _setRegionsData( await _apiRegions.mapToEntity());
    
}