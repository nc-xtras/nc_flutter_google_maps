part of '_index.dart';

class Mocks {
  static final Mocks instance = Mocks._privateConstructor();

  Mocks._privateConstructor();

  dynamic vectorRaw;
  dynamic pegatBatumbukRaw;

  Future<void> init() async {
    await initLoadJson();
    injectMocks();
  }

  Future<void> initLoadJson() async {
    final vectorJson = await Fun.loadJson('assets/json/vectors.json');

    vectorRaw = vectorJson["data"];

    final pegatBatumbukGeoJson = await Fun.loadJson('assets/json/pegat-batumbuk.geojson');
    pegatBatumbukRaw = pegatBatumbukGeoJson["features"];
    // logz.w('${pegatBatumbukGeoJson["features"][0]["geometry"]["coordinates"]}');
    // logz.i('${pegatBatumbukGeoJson["features"][0]["geometry"]["coordinates"][0][0]}');
  }

  injectMocks() {
    Repo.sample.injectMock(() => SampleRepoMock());
    Repo.maps.injectMock(() => MapsRepoMock());
  }
}
