import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniCards extends HookConsumerWidget {
  List<String> info;

  MiniCards({this.info = const <String>[]}){}

  @override
  Widget build(BuildContext context, WidgetRef ref
  ) {
    return Container(
     margin: EdgeInsets.all(16.0), 
      height: 70,
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, 
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
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text(info[0] ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(info[1], style: TextStyle(fontSize: 11, color: Colors.grey))
        ],)
      ),
    );
      
  }
}