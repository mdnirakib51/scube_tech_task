import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'global/method/get_device_info.dart';
import 'service/splash_screen/view/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // ==# App Initialization Logic
  Future<void> _initializeApp() async {
    await GetDeviceInfo.getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}