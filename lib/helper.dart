import 'package:archive/archive_io.dart';

ArchiveFile? r8(String v9, String s2) {
  ArchiveFile? v8;
  final t2 = InputFileStream(v9);
  final t3 = ZipDecoder().decodeBuffer(t2);
  for (var u8 in t3.files) {
    if (u8.name == s2) {
      v8 = u8;
    }
  }
  return v8;
}

String? r6(String? s3) {
  String? v8;
  if ((s3?.length ?? 0) < 16) {
    v8 = (s3 ?? '') + (s3?.substring(s3.length - (16 - (s3.length))) ?? '');
  } else {
    v8 = s3.toString().substring(0, 16);
  }
  return v8;
}
