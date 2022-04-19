part of 'camera_package.dart';

class _CameraImpl implements ICamera {
  @override
  FutureOr<File> pickImage(bool isFromCamera) async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: isFromCamera ? ImageSource.camera : ImageSource.gallery);
    if (_image == null) {
      throw InvalidFileException();
    }
    final _file = File(_image.path);
    return _file;
  }
}
