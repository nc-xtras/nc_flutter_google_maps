part of '_index.dart';

abstract class Prov {
  static Injected<SampleProv> get sample => _sampleProv;
  static Injected<MapsProv> get maps => _mapsProv;
}

final _sampleProv = RM2.inj(SampleProv());

final _mapsProv = RM2.inj(MapsProv());
