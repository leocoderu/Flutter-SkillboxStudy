import 'package:native_string/platform/service.dart';
import 'package:native_string/platform/web/web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Future<int> getValue() async => _manager.getValueFromJs();

  @override
  Stream<int> getStream() => _manager.buttonClicked; //!!!
}