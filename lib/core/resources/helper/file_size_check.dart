int fileSizeCheckInMB(int fileSizeInByte){
  final kb = fileSizeInByte ~/ 1024;
  final mb = kb ~/ 1024;
  return mb;
}