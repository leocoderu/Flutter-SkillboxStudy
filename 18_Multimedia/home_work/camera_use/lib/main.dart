// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Clear Architecture
import 'package:camera_use/business/gallery_bloc.dart';

// Import Widgets
import 'package:camera_use/camera_preview.dart';
import 'package:camera_use/gallery_show.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Demo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => GalleryBloc(),
        child: Scaffold(
            body: PageStorage(
              bucket: PageStorageBucket(),
              child: IndexedStack(
                index: indexPage,
                children: const [
                  CameraPreviewPage(),
                  GalleryShow(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const<BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.image),
                  label: 'Gallery',
                ),
              ],
              currentIndex: indexPage,
              onTap: (int index) => setState(() => indexPage = index),
            )
        ),
      ),
    );
  }
}
