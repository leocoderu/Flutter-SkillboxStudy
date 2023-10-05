import 'package:camera_use/gallery_show.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:camera/camera.dart';

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key});

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  late List<CameraDescription> camera;
  CameraController? controller;
  XFile? lastImage;

  @override
  initState() {
    super.initState();
    initCamera();
  }

  //@override
  void didChangeAppLifecycleState(AppLifecycleState state){
    final CameraController? cameraController = controller;

    if(cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if(state == AppLifecycleState.inactive){
      cameraController.dispose();
    } else if(state == AppLifecycleState.resumed) {
      _onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> initCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera preview"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          controller?.value.isInitialized == true
             ? Center(child: CameraPreview(controller!),)
             : const CircularProgressIndicator(),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              iconSize: 48.0,
              onPressed: () async {
                lastImage = await controller?.takePicture();
                GalleryShow.addImage(img: lastImage!);
                setState(() {});
              },
              icon: const Icon(Icons.camera),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    if(controller != null) {
      await controller!.dispose();
    }
    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: true,
      //ImageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    cameraController.addListener(() {
      if(mounted) setState(() {});
    });
  }
}
