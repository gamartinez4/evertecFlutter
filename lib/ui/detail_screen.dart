import '../../utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/region_data.dart';

class DetailsScreen extends HookConsumerWidget{

  Future <RegionData> fetchData(BuildContext context) async =>  
    ModalRoute.of(context)!.settings.arguments! as RegionData ;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
        appBar: AppBar(
        title: const Text('Detalle de región'),
      ),
        body: FutureBuilder<RegionData>(
          future: fetchData(context) , 
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return Stack(children: [
                Positioned(
                  top :30,
                  left: 30,
                  child: Image.asset('assets/cv2.jpg')
                  ),
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SvgPicture.asset('assets/twitter.svg',height: 40),
                     Text(snapshot.data?.twitter??'No hay dato', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.blue)),
                  ],)

                ),
                Center(
                  child:Container(
                    margin: const EdgeInsets.all(50.0),
                    padding: const EdgeInsets.all(10.0),
                    height:400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 242, 255), 
                      border: Border.all(
                        color: Colors.grey, 
                        width: 1.0, 
                      ),
                      borderRadius: BorderRadius.circular(15.0), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), 
                          spreadRadius: 1.0, 
                          blurRadius: 6.0, 
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data?.stateName??'No hay dato', style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15,),
                      const Text('Casos totales', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text(snapshot.data?.totalCases??'No hay dato', style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 4,),
                      const Text('Ultima modificación', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text(snapshot.data?.lastModification??'No hay dato', style: const  TextStyle(fontSize: 13)),
                      const SizedBox(height: 4,),
                      const Text('Muertes', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text((snapshot.data?.deathConfirmed??'No hay dato').formatToDecimal(), style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 4,),
                      const Text('positive', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text((snapshot.data?.positive??'No hay dato').formatToDecimal(), style: const  TextStyle(fontSize: 13)),
                      const SizedBox(height: 4,),
                      const Text('negative', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text((snapshot.data?.positive??'No hay dato').formatToDecimal(), style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 4,),
                      const Text('negative', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Text((snapshot.data?.positive??'No hay dato').formatToDecimal(), style: const TextStyle(fontSize: 13)),
                    ]
                  ),

                )
              )
              ],);
            } else {
              return Container(color: Colors.amber);
            }
          }
        )
      );
    }
  }