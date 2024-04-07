
import '../../utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/region_data.dart';
import '../injection.dart';
import '../notifiers/region_info_notifier.dart';

class ListedForFedStates extends HookConsumerWidget {

  final regionDataNotifier = ChangeNotifierProvider<RegionInfoNotifier>((ref) => getIt<RegionInfoNotifier>());


  @override
  Widget build(BuildContext context,  WidgetRef ref) {

    useEffect(() {
      ref.read(regionDataNotifier).retriveRegionsData();
      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles por región'),
      ),
      body: ListView.builder(
        itemCount: ref.watch(regionDataNotifier).regionsData.length,
        itemBuilder: (BuildContext context, int index) {
          RegionData regionData = ref.watch(regionDataNotifier).regionsData[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: SvgPicture.asset('assets/cv.svg', 
                width: 50,
                height: 50,
              ),
              title: Text(regionData.stateName),
              subtitle: Text(
                'Casos totales: ${regionData.totalCases.formatToDecimal()}\nÚltima modificación: ${regionData.lastModification.formatDate()}', 
                style: TextStyle(fontSize: 12,)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, "/details", arguments: regionData);
              },
            ),
          );
        },
      ),
    );
  }
}

