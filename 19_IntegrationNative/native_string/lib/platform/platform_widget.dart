import 'dummy/platform_view_dummy.dart'
if (dart.library.html) 'web/platform_view_web.dart'
if (dart.library.io) 'mobile/platform_view_mobile.dart';

abstract class PlatformWidget {}

PlatformWidget getWidget() {
  return const PlatformWidgetImpl();
}
