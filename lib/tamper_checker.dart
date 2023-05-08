import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:convert/convert.dart';
import 'package:crclib/catalog.dart' as oo;
import 'package:crypto/crypto.dart' as y;
import 'package:encrypt/encrypt.dart';

import 'helper.dart';
import 'tamper_checker_platform_interface.dart';

class TamperChecker {
  static TamperCheckerPlatform get _p => TamperCheckerPlatform.i;
  Future<Map> _r3(
    List<String> u1,
    String v9,
  ) async {
    Map u2 = {'sum': 0};
    for (String u7 in u1) {
      final u8 = File('$v9/$u7');
      if (await u8.exists()) {
        final u9 = await u8.readAsBytes();
        final t1 = oo.Crc32().convert(u9).toBigInt().toInt();
        u2['sum'] += t1;
        u2[u7] = t1;
      }
    }
    return u2;
  }

  static String a1 = '$z1$z2.$z3';
  static String z9 = 'so';
  static String a2 = '$z4.$z5';
  static String a3 = '$z6/${y4}64-${y5}a/$z8.$z9';
  static String y1 = 'Project';
  static String a4 = '$z6/$z7-${y2}a/$z8.$z9';
  static String a5 = '$z6/${y3}_64/$z8.$z9';
  static String z1 = 'Android';
  static String a6 = '$z6/${y4}64-${y5}a/${z6}f$y6.$z9';
  static String z7 = 'armeabi';
  static String a7 = '$z6/$z7-${y2}a/${z6}f$y6.$z9';
  static String y7 = 'Headers';
  static String a8 = '$z6/${y3}_64/${z6}f$y6.$z9';
  static String i1 = 'F${y8}s/$y9.f$y8/$y9';
  static String z8 = 'libapp';
  static String i2 = 'F${y8}s/$y9.f$y8/$x1.$x2';
  static String y5 = 'v8';
  static String w2 = 'h';
  static String i3 = 'F${y8}s/$y9.f$y8/_$x3$x4/$x3$x5';
  static String x6 = 'Messenger';
  static String i6 = 'F${y8}s/F$y6.f$y8/$x7.dat';
  static String x8 = 'CallbackCache';
  static String i15 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$x9$y1.$w2';
  static String z5 = 'dex';
  static String i16 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$w1.$w2';
  static String w3 = 'Channels';
  static String w4 = 'Controller';
  static String i22 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$w5${y9}LifeCycle$w6.$w2';
  static String i25 = '$w7.mobile$w8';
  static String z4 = 'classes';
  static String i26 = '${y9}F$y8$x1.$x2';
  static String i27 = w9;
  Future<String> checkTampering({String? sp}) async {
    String v8 = '';
    final v9 = await _p.gpba();
    final u1 = r1();
    if (v9?.isNotEmpty ?? false) {
      Map? u2;
      u2 = Platform.isAndroid ? await _r2(u1, v9!) : await _r3(u1, v9!);
      if (Platform.isAndroid) {
        final u3 = await r4(v9, sp);
        if (u3.contains(u2['sum'])) {
          v8 = r5(u3.toString());
        }
      } else if (Platform.isIOS) {
        v8 = r5([u2['sum']].toString());
      }
    }
    return v8;
  }

  String r5(String s4) {
    String v8 = '';
    var u4 = const Utf8Encoder().convert(s4);
    var u6 = y.md5;
    v8 = hex.encode(u6.convert(u4).bytes);
    return v8;
  }

  static String y2 = 'v7';
  static String i24 = 'F${y8}s/F$y6.f$y8/$y7/F${y6}View$w4.$w2';
  static String w1 = 'Engine';
  static String w6 = 'Delegate';
  static String i23 = 'F${y8}s/F$y6.f$y8/$y7/F${y6}Texture.$w2';
  static String x9 = 'Dart';
  static String y3 = 'x86';
  static String i19 = 'F${y8}s/F$y6.f$y8/$y7/F${y6}Macros.$w2';
  static String x3 = 'Code';
  static String i20 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$v1$v2.$w2';
  static String x4 = 'Signature';
  static String i21 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$w5.$w2';
  static String x5 = 'Resources';
  static String z2 = 'Manifest';
  static String i17 = 'F${y8}s/F$y6.f$y8/$y7/F$y6${w1}Group.$w2';
  static String z6 = 'lib';
  static String i18 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$v3$x9$w9.$w2';
  static String y4 = 'arm';
  Future<Map> _r2(
    List<String> u1,
    String v9,
  ) async {
    Map u2 = {'sum': 0};
    final t2 = InputFileStream(v9);
    final t3 = ZipDecoder().decodeBuffer(t2);
    for (ArchiveFile u8 in t3.files) {
      if (u1.contains(u8.name)) {
        final t1 = oo.Crc32().convert(u8.content).toBigInt().toInt();
        u2['sum'] += t1;
        u2[u8.name] = t1;
      }
    }
    return u2;
  }

  static String v5 = 'Binary';
  static String i7 = 'F${y8}s/F$y6.f$y8/$x1.$x2';
  static String v2 = 'Views';
  static String i13 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$w3.$w2';
  static String v1 = 'Platform';
  static String i14 = 'F${y8}s/F$y6.f$y8/$y7/F$y6${x3}cs.$w2';
  static String w7 = 'embedded';
  static String w8 = 'provision';
  Future r4(String? v9, String? v6) async {
    String? t4;
    String? t5;
    final t6 = r8(v9!, '$z4.$z5')?.crc32.toString();
    t4 = r6(t6);
    final t7 = r8(v9, '$z1$z2.$z3')?.crc32.toString();
    t5 = r6(t7);
    final t8 = r8(v9, '${t9}s/f${y6}_${t9}s/$v6');
    final s1 = r7(s4: utf8.decode(t8?.content), s5: t5 ?? '', s6: t4 ?? '');
    return json.decode(s1);
  }

  static String w5 = 'Plugin';
  static String i4 = 'F${y8}s/F$y6.f$y8/_$x3$x4/$x3$x5';
  static String v4 = 'odule';
  static String w9 = 'Runner';
  static String i5 = 'F${y8}s/F$y6.f$y8/F$y6';
  static String x7 = 'icudtl';
  static String v3 = 'Headless';
  String r7({required String s4, required String s5, required String s6}) {
    IV s7 = IV.fromUtf8(s6);
    Key s8 = Key.fromUtf8(s5);
    var s9 = Encrypter(AES(s8, mode: AESMode.cbc));
    return s9.decrypt64(s4, iv: s7);
  }

  static String z3 = 'xml';
  static String t9 = 'asset';
  static String y6 = 'lutter';
  List<String> r1() {
    List<String> v8 = [];
    if (Platform.isAndroid) {
      v8 = [a1, a2, a3, a4, a5, a6, a7, a8];
    } else if (Platform.isIOS) {
      v8 = [i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27];
    }
    return v8;
  }

  static String i10 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$y9$w6.$w2';
  static String y9 = 'App';
  static String i8 = 'F${y8}s/F$y6.f$y8/M${v4}s/m${v4}s.m${v4}map';
  static String y8 = 'ramework';
  static String i9 = 'F${y8}s/F$y6.f$y8/$y7/F$y6.$w2';
  static String x2 = 'plist';
  static String i11 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$v5$x6.$w2';
  static String x1 = 'info';
  static String i12 = 'F${y8}s/F$y6.f$y8/$y7/F$y6$x8.$w2';
}
