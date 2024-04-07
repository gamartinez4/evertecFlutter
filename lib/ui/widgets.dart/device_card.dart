import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entities/device_info_data.dart';

class DeviceInfoCard extends HookConsumerWidget {
  
  DeviceInfoData deviceInfoData;

  DeviceInfoCard({required this.deviceInfoData});

  @override
  Widget build(BuildContext context, WidgetRef ref
  ) {
    return Container(
     
  
      child:Stack(children: [

        Card(
      elevation: 6.0,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 50),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Column(children: [
              Column(children: [
                  Text(deviceInfoData.hour, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
                  Text(deviceInfoData.date, style: TextStyle(fontSize: 11)),
                  SizedBox(height:10)
              ]),
              Column(children: [
                  Text('Marca del dispositivo', style: TextStyle(fontSize: 11))  ,
                  Text(deviceInfoData.modelMark, style: TextStyle(fontSize: 11)),
                  SizedBox(height:10)
              ]),
              Column(children: [
                  Text('Modelos del dispositivo', style: TextStyle(fontSize: 11))  ,
                  Text(deviceInfoData.modelDevice, style: TextStyle(fontSize: 11))
              ])
             ],
             ),
             SizedBox(width:30),
             Column(children: [
              Column(children: [
                  Text('Nombres del dispositivo',style: TextStyle(fontSize: 11)), 
                  Text(deviceInfoData.nameDevice,style: TextStyle(fontSize: 11)),
                   SizedBox(height:10)
              ]),
              Column(children: [
                  const Text('Tipo de dispositivo', style: TextStyle(fontSize: 11))  ,
                  Text(deviceInfoData.typeDevice, style: TextStyle(fontSize: 11)),
                  SizedBox(height:10)
              ]),
              Column(children: [
                  Text('Sistema operativo y su version', style: TextStyle(fontSize: 11))  ,
                  Text(deviceInfoData.os, style: TextStyle(fontSize: 11)),
                  
              ])
             ],
             )
             
          ],
        ),
      ),
    ),
    
     Positioned(right: 50,bottom: 0,child: 
     Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
            Switch(
              value: true,
              onChanged: (value) {},
              ),
               SvgPicture.asset('assets/moon.svg', height: 20,width: 20,), 
                  
              ])
     
     ) 
      ],)
      );
  }
}