import 'dart:io';
import 'dart:isolate';

class DecodeSettings {
  final SendPort sendPort;
  final File file;
  DecodeSettings(this.sendPort, this.file);
}
