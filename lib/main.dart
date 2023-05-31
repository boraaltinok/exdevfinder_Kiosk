import 'package:exdevfinder_kiosk/home_page.dart';
import 'package:exdevfinder_kiosk/kiosk_controller.dart';
import 'package:exdevfinder_kiosk/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(VideoController());
    Get.put(KioskController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      home: const HomePage(),
    );
  }
}
