part of '_index.dart';

class MapsRepoMock implements MapsRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from MapsRepoMock');
    return x;
  }

  @override
  Future<List<Vector>> loadVectors() async {
    try {
      List<Vector> vectorList = [];

      for (var vector in Mocks.instance.vectorRaw) {
        vectorList.add(Vector.fromMap(vector));
      }
      return vectorList;
    } catch (e) {
      logzz.e(MapsRepoMock, 'OnError: $e');
      rethrow;
    }
  }

  @override
  Future<List<PegatBatumbuk>> loadPegatBatumbuk() async {
    try {
      List<PegatBatumbuk> pegatBatumbukList = [];
      for (var el in Mocks.instance.pegatBatumbukRaw) {
        pegatBatumbukList.add(PegatBatumbuk.fromMap(el));
      }
      return pegatBatumbukList;
    } catch (e) {
      logzz.e(MapsRepoMock, 'OnError: $e');
      rethrow;
    }
  }
}
