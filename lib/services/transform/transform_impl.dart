part of 'transform_package.dart';

class TransformImpl implements ITransform {
  @override
  Future<File> transform(File file, TransformType transformType) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(transformType.function, DecodeSettings(receivePort.sendPort, file));
    var _file = receivePort.first as File;
    return _file;
  }
}
