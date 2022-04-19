part of 'transform_package.dart';

enum TransformType { sum, sub, topology, geometric, intensity }

const _functionMapping = {
  TransformType.sum: _Arithmetic.sum,
  TransformType.sub: _Arithmetic.sub,
  TransformType.topology: _Topology.labelling,
  TransformType.geometric: _Geometric.reflex,
  TransformType.intensity: _Intensity.negative,
};

extension _TransformMapper on TransformType {
  void Function(DecodeSettings) get function => _functionMapping[this]!;
}
