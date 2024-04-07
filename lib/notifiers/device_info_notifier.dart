import 'dart:io';

import 'package:ceiba_flutter/entities/device_info_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../injection.dart';

class DeviceInfoNotifier extends ChangeNotifier{
  
    final _deviceInfoPlugin = getIt<DeviceInfoPlugin>();

    DeviceInfoData _deviceInfoData = DeviceInfoData(); 
    DeviceInfoData get deviceInfoData => _deviceInfoData;

    void _setDeviceInfoData(DeviceInfoData deviceInfoData){
      _deviceInfoData = deviceInfoData;
      notifyListeners();
    }

    Future<void> retriveDeviceData() async {
      String hour = DateFormat('h:mma').format(DateTime.now()).toLowerCase();
      String date = DateFormat('MM/dd/yy').format(DateTime.now());
      String modelMark = '';
      String modelDevice = '';
      String nameDevice = '';
      String typeDevice = '';
      String os = '';

      try {
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
          modelMark = androidInfo.brand ?? 'Unknown';
          modelDevice = androidInfo.model ?? 'Unknown';
          nameDevice = androidInfo.device ?? 'Unknown';
          os = 'Android ${androidInfo.version.release}';
          typeDevice = 'Android';
        } else if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
          modelMark = 'Apple';
          modelDevice = iosInfo.model ?? 'Unknown';
          nameDevice = iosInfo.name ?? 'Unknown';
          os = 'iOS ${iosInfo.systemVersion}';
          typeDevice = 'iOS';
        }

        DeviceInfoData deviceInfoData = DeviceInfoData(
          hour: hour,
          date: date,
          modelMark: modelMark,
          modelDevice: modelDevice,
          nameDevice: nameDevice,
          typeDevice: typeDevice,
          os: os,
        );

        _setDeviceInfoData(deviceInfoData);
      } catch (e) {
        print('Error obteniendo información del dispositivo: $e');
      }
    }
  
}