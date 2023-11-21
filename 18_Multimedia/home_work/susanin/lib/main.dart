import 'package:flutter/material.dart';
import 'package:susanin/widget/control_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YandexMapController controller;
  final animation = const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  double zoomLevel = 2.0;
  double minZoom = 0.0;
  double maxZoom = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project Susanin'), centerTitle: true),
      body: Center(
        child: Stack(
          children: <Widget>[
            SafeArea(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: YandexMap(
                      onMapCreated: (YandexMapController yandexMapController) async {
                        controller = yandexMapController;
                        CameraPosition camPos = await controller.getCameraPosition();
                        await controller.moveCamera(
                            CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: const Point(
                                      latitude: 59.945933,
                                      longitude: 30.320045,
                                    ),
                                    zoom: camPos.zoom,
                                )
                            )
                        );
                        setState(() async {
                          minZoom = await controller.getMinZoom();
                          maxZoom = await controller.getMaxZoom();
                        });
                      },
                    )
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: (MediaQuery.orientationOf(context) == Orientation.portrait)
                    ? const EdgeInsets.symmetric(horizontal: 100.0)
                    : const EdgeInsets.symmetric(horizontal: 200.0),
                height: 350.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: (MediaQuery.orientationOf(context) == Orientation.portrait)
                        ? MainAxisAlignment.center : MainAxisAlignment.end,
                      children: [
                        ControlButton(
                          onPressed: () {moveLeft(10.0);},
                          icon: Icons.arrow_circle_left_outlined,
                        ),
                        Column(
                          children: [
                            ControlButton(
                              onPressed: () {moveUp(10.0);},
                              icon: Icons.arrow_circle_up,
                            ),
                            ControlButton(
                              onPressed: () async {
                                CameraPosition camPos = await controller.getCameraPosition();
                                await controller.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: const Point(
                                        latitude: 59.945933,
                                        longitude: 30.320045,
                                      ),
                                      zoom: camPos.zoom
                                    )
                                  ),
                                  animation: animation
                                );
                              },
                              icon: Icons.home_outlined,
                            ),
                            ControlButton(
                              onPressed: () {moveDown(10.0);},
                              icon: Icons.arrow_circle_down,
                            ),
                          ],
                        ),
                        ControlButton(
                          onPressed: () {moveRight(10.0);},
                          icon: Icons.arrow_circle_right_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Slider(
                      min: minZoom,
                      max: maxZoom,
                      value: zoomLevel,
                      onChanged: (value) async {
                        setState(() => zoomLevel = value);
                        await controller.moveCamera(CameraUpdate.zoomTo(value));
                      },
                    ),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }

  moveUp(double distance) async {
    CameraPosition camPos = await controller.getCameraPosition();
    await controller.moveCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: Point(
                    latitude: camPos.target.latitude + distance,
                    longitude: camPos.target.longitude
                ),
                zoom: camPos.zoom
            )
        ),
        animation: animation
    );
  }
  moveDown(double distance) async {
    CameraPosition camPos = await controller.getCameraPosition();
    await controller.moveCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: Point(
                    latitude: camPos.target.latitude - distance,
                    longitude: camPos.target.longitude
                ),
                zoom: camPos.zoom
            )
        ),
        animation: animation
    );
  }

  moveRight(double distance) async {
    CameraPosition camPos = await controller.getCameraPosition();
    await controller.moveCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: Point(
                    latitude: camPos.target.latitude,
                    longitude: camPos.target.longitude + distance
                ),
                zoom: camPos.zoom
            )
        ),
        animation: animation
    );
  }
  moveLeft(double distance) async {
    CameraPosition camPos = await controller.getCameraPosition();
    await controller.moveCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: Point(
                    latitude: camPos.target.latitude,
                    longitude: camPos.target.longitude - distance
                ),
                zoom: camPos.zoom
            )
        ),
        animation: animation
    );
  }
}
