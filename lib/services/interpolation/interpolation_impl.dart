part of 'interpolation_package.dart';

class InterpolationImpl implements IInterpolation {
  @override
  Future<File> interpolation(File file, InterpolationType interpolationType) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(interpolationType.function, DecodeSettings(receivePort.sendPort, file));
    var _file = receivePort.first as File;
    return _file;
  }
}
