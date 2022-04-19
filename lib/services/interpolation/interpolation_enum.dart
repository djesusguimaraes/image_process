part of 'interpolation_package.dart';

enum InterpolationType { bilinearLess, bilinearMore, neighborLess, neighborMore }

const _functionMapping = {
  InterpolationType.bilinearLess: _Bilinear.less,
  InterpolationType.bilinearMore: _Bilinear.more,
  InterpolationType.neighborLess: _Neighbor.less,
  InterpolationType.neighborMore: _Neighbor.more,
};

extension _InterpolationMapper on InterpolationType {
  void Function(DecodeSettings) get function => _functionMapping[this]!;
}
