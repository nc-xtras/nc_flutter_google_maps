part of '_index.dart';

class MapsRepoMock implements MapsRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from MapsRepoMock');
    return x;
  }
}
