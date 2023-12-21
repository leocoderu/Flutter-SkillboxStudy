import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:native_string/platform/platform_widget.dart';

class PlatformWidgetImpl extends StatelessWidget implements PlatformWidget {
  const PlatformWidgetImpl({super.key});

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      const String viewType = 'INTEGRATION_ANDROID';
      final Map<String, dynamic> creationParams = <String, dynamic>{};

      view = PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
                controller: controller as AndroidViewController,
                hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{}
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
                id: params.id,
                viewType: viewType,
                layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                  params.onFocusChanged(true);
              }
            )
                ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
                ..create();
          },

      );

    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      view = UiKitView(
        viewType: 'INTEGRATION_IOS',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      view = Text('$defaultTargetPlatform is not yet supported');
    }

    return SizedBox(height: 50, width: 120, child: view);
  }

  void _onPlatformViewCreated(int id) {
    // ignore: avoid_print
    print('Platform with id: $id created');
  }
}
