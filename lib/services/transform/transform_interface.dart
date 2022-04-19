part of 'transform_package.dart';

abstract class ITransform {
  Future<File> transform(File file, TransformType type);
}
