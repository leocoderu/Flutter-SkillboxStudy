import 'package:native_string/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  @override
  Stream<String> getStream() {        //!!! int
    throw UnimplementedError();
  }

  @override
  Future<int> getValue() {
    throw UnimplementedError();
  }

  @override
  Future<String> sendString(String data) {
    throw UnimplementedError();
  }
}