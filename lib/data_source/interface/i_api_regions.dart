import '../../dto/current_dto.dart';
import '../../dto/info_dto.dart';
import '../../entities/region_data.dart';

abstract class IApiRegions{
    Future<List<InfoDto>> retrieveInfoDtoData();

    Future<List<CurrentDto>> retrieveCurrentDtoData();

    Future<List<RegionData>> mapToEntity() ;
}