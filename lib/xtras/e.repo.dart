part of '_index.dart';

abstract class Repo {
  static Injected<SampleRepo> get sample => _sampleRepo;
  static Injected<MapsRepo> get maps => _mapsRepo;
}

final _sampleRepo = RM3.inj(SampleRepo());

final _mapsRepo = RM3.inj(MapsRepo());
