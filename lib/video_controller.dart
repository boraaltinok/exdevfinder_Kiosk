import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final Rx<String> _text = "hello".obs;
  final Rx<bool> _isFullScreenMode = false.obs;
  final Rx<bool> _selectedVideoFinished = false.obs;
  late Rx<VideoPlayerController> _videoPlayerController =
      VideoPlayerController.network('https://www.fluttercampus.com/video.mp4')
          .obs;

  final Rx<String> _currentPageName = "".obs;

  bool get selectedVideoFinished => _selectedVideoFinished.value;

  bool get isFullScreenMode => _isFullScreenMode.value;

  VideoPlayerController get videoPlayerController =>
      _videoPlayerController.value;

  String get text => _text.value;
  String get currentPageName => _currentPageName.value;

  @override
  void onInit() {
    // TODO: implement onInit

    _initializeVideoPlayerController();
    _videoPlayerController.value.addListener(_addVideoListener);
    super.onInit();
  }

  void setCurrentPageName({required String pageName}) {
    _currentPageName.value = pageName;
  }

  void _initializeVideoPlayerController() {
    _videoPlayerController.value =
        VideoPlayerController.asset("assets/video1.mp4");
    _videoPlayerController.value.initialize().then((_) {
      //_videoPlayerController.value.setLooping(true);
      _videoPlayerController.value.play();
      _videoPlayerController.value.addListener(_addVideoListener);
    });
  }

  void _addVideoListener() {
    if (_videoPlayerController.value.value.isPlaying &&
        _videoPlayerController.value.value.position >=
            _videoPlayerController.value.value.duration) {
      // Video has finished playing
      // Do something here, such as changing the video or performing an action
      setIsFullScreenMode(isFullScreen: false);
      print("video finished");
    }

    if (_videoPlayerController.value.value.position >=
        _videoPlayerController.value.value.duration) {
      // Video has finished playing (including looped)
      // Add your code here to handle the completion event
      setIsFullScreenMode(isFullScreen: false);
      print("video finished");
    }
  }

  void changeSelectedVideoFinished({required bool isFinished}) {
    _selectedVideoFinished.value = isFinished;
  }

  void onBackButtonPressed() {}

  void setIsFullScreenMode({required bool isFullScreen}) {
    _isFullScreenMode.value = isFullScreen;
    print("isFullScreenMode ${isFullScreen}");
    if (!isFullScreen) {
      //if the previous video is over show the overview video
      print("inside if");
      changeAndPlayVideo(videoName: 'video1.mp4');
    } else {
      print("inside else");
      playTheVideo();
    }
  }

  void playTheVideo() {
    _videoPlayerController.value.play();
  }

  void pauseTheVideo() {
    _videoPlayerController.value.pause();
  }

  void changeAndPlayVideo({required String videoName}) {
    _videoPlayerController.value.pause();
    _videoPlayerController.value.dispose();

    _videoPlayerController.value =
        VideoPlayerController.asset("assets/$videoName");
    _videoPlayerController.value.initialize().then((_) {
      //_videoPlayerController.value.setLooping(true);
      playTheVideo();
      _videoPlayerController.value.addListener(_addVideoListener);
    });
  }
}
