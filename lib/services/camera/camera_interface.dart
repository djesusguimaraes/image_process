part of 'camera_package.dart';

abstract class ICamera {
  FutureOr<File> pickImage(bool isFromCamera);
}
