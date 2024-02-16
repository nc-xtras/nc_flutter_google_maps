part of '_index.dart';

class Mocks {
  static final Mocks instance = Mocks._privateConstructor();

  Mocks._privateConstructor();

  dynamic vectorRaw;

  Future<void> init() async {
    initLoadJson();
    injectMocks();
  }

  initLoadJson() async {
    final vectorJson = await Fun.loadJson('assets/json/vectors.json');
    logz.i('init vectorJson: $vectorJson');
    // await Future.delayed(2.seconds);
    vectorRaw = vectorJson["data"];
    logz.i('init vectorRaw: $vectorRaw');
  }

  injectMocks() {
    Repo.sample.injectMock(() => SampleRepoMock());
    Repo.maps.injectMock(() => MapsRepoMock());
  }
}
