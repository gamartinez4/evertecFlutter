
import 'package:ceiba_flutter/data_source/interface/i_api_regions.dart';

import '../../dto/current_dto.dart';
import '../../dto/info_dto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../entities/region_data.dart';

class ApiRegions implements IApiRegions{

    Future<List<InfoDto>> retrieveInfoDtoData() async {
      final url = Uri.parse('https://api.covidtracking.com/v1/states/info.json');
      final response = await http.get(url);
      if (response.statusCode == 200) {
     
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return  List<InfoDto>.from(data.map((e) => InfoDto.fromJson(e)));
        } else {
          throw Exception('No data found');
        }
      } else {
        throw Exception('Failed to load info data');
      }
    }

    Future<List<CurrentDto>> retrieveCurrentDtoData() async {
      final url = Uri.parse('https://api.covidtracking.com/v1/states/current.json');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return  List<CurrentDto>.from(data.map((e) => CurrentDto.fromJson(e)));
        } else {
          throw Exception('No data found');
        }
      } else {
        throw Exception('Failed to load current data');
      }
    }

    Future<List<RegionData>> mapToEntity() async{
      List<InfoDto> infoDtosLocal =  await retrieveInfoDtoData();
      List<CurrentDto> currentDtosLocal =  await retrieveCurrentDtoData();
      List<RegionData> regionData = [];
      for (var infoDto in infoDtosLocal) {
        for (var currentDto in currentDtosLocal) {
          if(currentDto.stateInitials == infoDto.stateInitials) {
            regionData.add(
              RegionData(
                stateName: infoDto.stateName??'',
                totalCases: currentDto.totalCases??'',
                lastModification: currentDto.lastModification??'',
                deathConfirmed:  currentDto.deathConfirmed??'',
                positive: currentDto.positive??'',
                negative: currentDto.negative??'',
                twitter: infoDto.twitter??''
                )
              );
            }
          }
        }
      return regionData;
    }
}
