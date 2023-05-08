import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tamper_checker_platform_interface.dart';

class MethodChannelTamperChecker extends TamperCheckerPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('tc');

  @override
  Future<String?> gpba() async {
    return await methodChannel.invokeMethod('gba');
  }
}
