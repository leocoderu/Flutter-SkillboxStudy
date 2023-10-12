// Import Flutter
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

// Import Packages
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Clear Architecture
import 'package:camera_use/business/gallery_bloc.dart';
import 'package:camera_use/business/gallery_bloc_actions.dart';
import 'package:camera_use/model/gallery_model.dart';

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key});

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> with WidgetsBindingObserver {
  CameraController? controller;

  @override
  initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera preview"),
        centerTitle: true,
      ),
      body: BlocBuilder<GalleryBloc, GalleryModel>(
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: controller?.value.isInitialized == true
                ? CameraPreview(controller!)
                : const CircularProgressIndicator(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, bottom: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(60, 60)),
                      maximumSize: MaterialStateProperty.all(const Size(60, 60)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ),
                      alignment: Alignment.center,
                    ),
                    onPressed: () async {
                      await controller!.takePicture().then((value) {
                        context.read<GalleryBloc>().add(AddImage(img: value.path));
                      });
                    },
                    child: const Icon(Icons.camera, size: 30,),
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }

  @override
  void dispose() {
    controller!.dispose();
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
