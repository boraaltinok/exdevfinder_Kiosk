import 'package:exdevfinder_kiosk/TextStyleUtility.dart';
import 'package:exdevfinder_kiosk/kiosk_controller.dart';
import 'package:exdevfinder_kiosk/video_controller.dart';
import 'package:exdevfinder_kiosk/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String txtButton1 = "ExDev nedir?";

  final String txtButton2 = "ExDev nasıl kullanılır?";

  final String txtButton3 = "ExDev nasıl expert önerir?";

  final String txtButton4 = "ExDev ile şirketinizi optimize edin";

  @override
  void initState() {
    // TODO: implement initState
    startKioskMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return Scaffold(
      body: Obx(() {
        return Row(
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                height: 0,
                width: 0,
              ),
              secondChild: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: Get.width * 2 / 5,
                  height: Get.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              Get.find<VideoController>()
                                  .changeAndPlayVideo(videoName: "video_final1.mp4");
                              Get.find<VideoController>()
                                  .setIsFullScreenMode(isFullScreen: true);
                              Get.find<VideoController>()
                                  .setCurrentPageName(pageName: txtButton1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25)),
                              width: Get.width * 2 / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(txtButton1, style: TextStyleUtility.buttonTextStyle,),
                                  /*Lottie.asset(
                                    'animations/overview_lottie.json',
                                    height: 300,
                                    reverse: true,
                                    repeat: true,
                                  )*/
                                ],
                              ),
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              Get.find<VideoController>()
                                  .changeAndPlayVideo(videoName: "video_final2.mp4");
                              Get.find<VideoController>()
                                  .setIsFullScreenMode(isFullScreen: true);
                              Get.find<VideoController>()
                                  .setCurrentPageName(pageName: txtButton2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25)),
                              width: Get.width * 2 / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(txtButton2, style: TextStyleUtility.buttonTextStyle),
                                  /*Lottie.asset(
                                    'animations/calculation_lottie.json',
                                    height: 100,
                                    reverse: true,
                                    repeat: true,
                                  )*/
                                ],
                              ),
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              Get.find<VideoController>()
                                  .changeAndPlayVideo(videoName: "video_final3.mp4");
                              Get.find<VideoController>()
                                  .setIsFullScreenMode(isFullScreen: true);
                              Get.find<VideoController>()
                                  .setCurrentPageName(pageName: txtButton3);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25)),
                              width: Get.width * 2 / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(txtButton3, style: TextStyleUtility.buttonTextStyle),
                                  /*Lottie.asset(
                                    'animations/company_usage_lottie.json',
                                    height: 300,
                                    reverse: true,
                                    repeat: true,
                                  )*/
                                ],
                              ),
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              Get.find<VideoController>()
                                  .changeAndPlayVideo(videoName: "video_final4.mp4");
                              Get.find<VideoController>()
                                  .setIsFullScreenMode(isFullScreen: true);
                              Get.find<VideoController>()
                                  .setCurrentPageName(pageName: txtButton4);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(25)),
                              width: Get.width * 2 / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(txtButton4, style: TextStyleUtility.buttonTextStyle),
                                  /*Lottie.asset(
                                    'animations/graph_visualization_lottie.json',
                                    height: 300,
                                    reverse: true,
                                    repeat: true,
                                  )*/
                                ],
                              ),
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
              ),
              crossFadeState: Get.find<VideoController>().isFullScreenMode
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 1000),
            ),
            Expanded(child: VideoScreen())
          ],
        );
      }),
    );
  }
}
