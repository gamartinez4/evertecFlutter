import '../../entities/country_data.dart';

abstract class IApiCountry{

  Future<CountryData> countryDataRequest();
}