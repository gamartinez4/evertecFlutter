import 'dart:io';



import '../../injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'ui/detail_screen.dart';
import 'ui/listed_for_fed_states_screen.dart';
import 'ui/login_screen.dart';
import 'ui/main_screen.dart';
import 'ui/splash_sreen.dart';


void main() async { 
  runApp(
    const ProviderScope(child:MyApp()));
    setup();
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      routes: {
        "/login": (_)=> LoginScreen(),
        "/main": (_)=> MainScreen(),
        "/list": (_)=> ListedForFedStates(),
        "/details": (_)=> DetailsScreen(),
       },
      home: SplashScreen(),
    );
  }
}

