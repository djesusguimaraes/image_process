part of 'interpolation_package.dart';

abstract class IInterpolation {
  Future<File> interpolation(File file, InterpolationType type);
}
