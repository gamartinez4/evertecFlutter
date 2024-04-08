
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_source/implementation/api_country.dart';
import 'data_source/implementation/api_login.dart';
import 'data_source/implementation/api_regions.dart';
import 'data_source/interface/i_api_country.dart';
import 'data_source/interface/i_api_login.dart';
import 'data_source/interface/i_api_regions.dart';
import 'notifiers/country_info_notifier.dart';
import 'notifiers/login_notifier.dart';
import 'notifiers/region_info_notifier.dart';

final getIt = GetIt.instance;

void setup() {
   getIt.registerSingleton(DeviceInfoPlugin());

   getIt.registerSingleton<IApiLogin>(ApiLogin());
   getIt.registerSingleton<LoginNotifier>(LoginNotifier( getIt<IApiLogin>()));

   getIt.registerSingleton<IApiCountry>(ApiCountry());
   getIt.registerSingleton<CountryInfoNotifier>(CountryInfoNotifier(getIt<IApiCountry>()));

   getIt.registerSingleton<IApiRegions>(ApiRegions());
   getIt.registerSingleton<RegionInfoNotifier>(RegionInfoNotifier(getIt<IApiRegions>()));
}