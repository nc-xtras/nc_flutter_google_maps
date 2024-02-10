part of '_index.dart';

class MapsCtrl {
  init() => logxx.i(MapsCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();
}
