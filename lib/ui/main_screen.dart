
import '../../utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../injection.dart';
import '../notifiers/country_info_notifier.dart';
import '../notifiers/device_info_notifier.dart';
import 'widgets.dart/device_card.dart';
import 'widgets.dart/mini_cards.dart';

class MainScreen extends HookConsumerWidget {

  final deviceInfoDataNotifier = ChangeNotifierProvider<DeviceInfoNotifier>((ref) => DeviceInfoNotifier());
  final countryDataNotifier = ChangeNotifierProvider<CountryInfoNotifier>((ref) => getIt<CountryInfoNotifier>());

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      ref.read(deviceInfoDataNotifier).retriveDeviceData();
      ref.read(countryDataNotifier).retriveCountryData();
      return () {};
    }, const []);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Tema para el modo diurno
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        // Tema para el modo nocturno
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Scaffold(body:SingleChildScrollView(child: 
      Stack(children: [
        Positioned(child: Image.asset('assets/sentado.jpg', fit: BoxFit.cover),),
        Positioned(child:SvgPicture.asset('assets/cv.svg', height: 170,),top: 40), 
        
        Column(children: [
            SizedBox(height:230),
            DeviceInfoCard(deviceInfoData: ref.watch(deviceInfoDataNotifier).deviceInfoData),
            SizedBox(height:20),
            Text('fecha recoleccino Datos: dd.mm.yyyy'),
            SizedBox(height:20),
        
            Row(mainAxisAlignment:MainAxisAlignment.center ,
              children: [
              Column(children: [
                MiniCards(info: ['Casos Totales', ref.watch(countryDataNotifier).countryData.totalTestResults.formatToDecimal()]),
                MiniCards(info: ['Pruebas negativas', ref.watch(countryDataNotifier).countryData.negative.formatToDecimal()]),
                MiniCards(info: ['Fallecidos', ref.watch(countryDataNotifier).countryData.death.formatToDecimal()]),
              
              ],),
              Column(children: [
                MiniCards(info: ['Pruebas pendientes', ref.watch(countryDataNotifier).countryData.pending.formatToDecimal()]),
                MiniCards(info: ['Casos Totales', ref.watch(countryDataNotifier).countryData.positive.formatToDecimal()]),
                MiniCards(info: ['Casos Totales', ref.watch(countryDataNotifier).countryData.recovered.formatToDecimal()]),
               
              ],)
            ],),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('El proyecto COVID Tracking ha finalizado todarecopilación de datos a partir del 7 de marzo de 2021',style: TextStyle(fontSize: 11, color: Colors.grey))
              ),
              FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, "/list"))
          
          ],),
        Positioned(
          top: 40, 
          right: 40,
          child: IconButton(
            icon: SvgPicture.asset('assets/logout.svg',width: 30, height: 30, ),
            onPressed:(){
              Navigator.pop(context);
            },
          
          )
        ), 
      ]))
      )
    );
  }}