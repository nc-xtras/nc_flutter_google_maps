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
      // final result = await Fun.loadJson('assets/json/vectors.json');
      // await Future.delayed(2.seconds);
      // final dataRaw = result['data'];
      // logz.w(dataRaw);
      for (var vector in Mocks.instance.vectorRaw) {
        vectorList.add(Vector.fromMap(vector));
      }
      logz.w(vectorList.toString());
      return vectorList;
    } catch (e) {
      logzz.e(MapsRepoMock, 'OnError: $e');
      rethrow;
    }
  }
}
