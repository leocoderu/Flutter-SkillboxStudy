import 'dummy/dummy_service.dart'
if (dart.library.html) 'web/web_service.dart'
if (dart.library.io) 'mobile/mobile_service.dart';

abstract class PlatformService {
  Future<int> getValue();
  Stream<String> getStream();
  Future<String> sendString(String data);
}

PlatformService getService() {
  return PlatformServiceImpl();
}
