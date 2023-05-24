import 'package:exdevfinder_kiosk/TextStyleUtility.dart';
import 'package:exdevfinder_kiosk/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, }) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Get.find<VideoController>().videoPlayerController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Expanded(
                child: Stack(children: [
                  VideoPlayer(
                      Get.find<VideoController>().videoPlayerController),
              Get.find<VideoController>().isFullScreenMode == true
                  ? Positioned(
                      top: 35,
                      left: 15,
                      child: CircleAvatar(
                        child: IconButton(
                          color: Colors.black87,
                        icon: const Icon(Icons.arrow_back_outlined),
                        onPressed: () {
                            print("pressed");
                          Get.find<VideoController>().setIsFullScreenMode(isFullScreen: false);
                        },
                    ),
                      ))
                  : SizedBox(),
                  Get.find<VideoController>().isFullScreenMode == true
                      ? Positioned(
                      top: 35,
                      left: 55,
                      child: Container(
                        height: Get.height * 1/ 10,
                        width: Get.width / 2,
                        color: Colors.black87.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Get.find<VideoController>().currentPageName,
                              style: TextStyleUtility.titleTextStyle,
                            ),
                          ],
                        ),
                      ))
                      : SizedBox()
            ]))
          ],
        );
      }),
    );
  }
}
