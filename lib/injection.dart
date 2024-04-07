
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_source/api_country.dart';
import 'data_source/api_login.dart';
import 'data_source/api_regions.dart';
import 'notifiers/country_info_notifier.dart';
import 'notifiers/login_notifier.dart';
import 'notifiers/region_info_notifier.dart';

final getIt = GetIt.instance;

void setup() {
   //getIt.. registerFactory<TableSelector>(() => TableSelector());
   getIt.registerSingleton<ApiLogin>(ApiLogin());
   getIt.registerSingleton<LoginNotifier>(LoginNotifier( getIt<ApiLogin>()));

   getIt.registerSingleton(DeviceInfoPlugin());

   getIt.registerSingleton<ApiCountry>(ApiCountry());
   getIt.registerSingleton<CountryInfoNotifier>(CountryInfoNotifier(getIt<ApiCountry>()));

   getIt.registerSingleton<ApiRegions>(ApiRegions());
   getIt.registerSingleton<RegionInfoNotifier>(RegionInfoNotifier(getIt<ApiRegions>()));
}