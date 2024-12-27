// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import Navigation
import 'fluro_router.dart';

// Import widgets
import 'pages/main_page.dart';

// Function for preload SVG files
Future<void> preloadSVGs(List<String> assetPaths) async {
  for (final path in assetPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
          () => loader.loadBytes(null),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await preloadSVGs([
    'assets/system/svg/logo.svg',
    // Type here all svg assets for cache it
  ]);

  // Initialize Fluro Router Navigator
  MyFluroRouter.setupRouter();

  // Initialize Dependency Injection Services (Locator)
  //await setupServices();

  runApp(MultiBlocProvider(providers: [
    //BlocProvider(create: (_) => AppStateBloc()),
    // Type here all BloC states
  ],
    child: const MainPage(),
  ));
}

