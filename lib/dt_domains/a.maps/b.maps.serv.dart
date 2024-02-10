part of '_index.dart';

class MapsServ {
  void init() {
    logxx.i(MapsServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(MapsServ, 'rxCounter setState success');
  }
}
