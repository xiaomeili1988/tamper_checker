import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tamper_checker_method_channel.dart';

abstract class TamperCheckerPlatform extends PlatformInterface {
  TamperCheckerPlatform() : super(token: _t);

  static final Object _t = Object();

  static TamperCheckerPlatform _i = MethodChannelTamperChecker();

  static TamperCheckerPlatform get i => _i;

  static set instance(TamperCheckerPlatform i) {
    PlatformInterface.verifyToken(i, _t);
    _i = i;
  }

  Future<String?> gpba() {
    throw UnimplementedError('gpba() has not been implemented.');
  }
}
