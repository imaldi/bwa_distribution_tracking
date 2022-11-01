import 'dart:io';

import 'package:bwa_distribution_tracking/core/resources/helper/file_size_check.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File> fileCompressor(File file) async {

  var fileSize = fileSizeCheckInMB(file.readAsBytesSync().lengthInBytes);
  print("image size in widget: $fileSize MB");
  var compressedResult;
  var filePath = file.path;
  final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
  print("outPath: $outPath");
  if (fileSize >= 2) {
    compressedResult = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 80,
    );
    if (compressedResult != null) {
      var compressedSize = fileSizeCheckInMB(compressedResult.readAsBytesSync().lengthInBytes ?? 0);
      if (compressedSize > 2) {
        compressedResult = await fileCompressor(compressedResult);
      }
    }
  }
  return compressedResult ?? file;
}
