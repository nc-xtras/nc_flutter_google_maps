part of '_index.dart';

class MapsRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from MapsRepo');
    return x;
  }
}
