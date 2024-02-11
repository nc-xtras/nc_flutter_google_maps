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

  onMapCreated(GoogleMapController controller) async {
    if (_pv.rxGmapCompleter.st.isCompleted) {
      logz.wtf("onMapCreated is called after the Google Map has been created");
      _pv.rxGmapController.st = controller;
    } else {
      logz.wtf("attempting to complete the process");
      _pv.rxGmapCompleter.st.complete(controller);
      _pv.rxGmapController.st = await _pv.rxGmapCompleter.st.future;
    }
  }

  Future<void> updateBearing(double degree) async {
    _pv.rxBearing.st = _pv.rxBearing.st + degree;
    animateCamera();
  }

  Future<void> updateTilt(double degree) async {
    if (degree == 0) {
      _pv.rxTilt.st = 0.0;
    } else {
      _pv.rxTilt.st = _pv.rxTilt.st + degree;
    }
    animateCamera();
  }

  Future<void> updateZoom(double level) async {
    _pv.rxZoom.st = _pv.rxZoom.st + level;
    animateCamera();
  }

  animateCamera() {
    _pv.rxGmapController.st?.animateCamera(
      CameraUpdate.newCameraPosition(
        getCameraPosition(),
      ),
    );
  }

  CameraPosition getCameraPosition() {
    return CameraPosition(
      target: _pv.rxTarget.st,
      bearing: _pv.rxBearing.st,
      tilt: _pv.rxTilt.st,
      zoom: _pv.rxZoom.st,
    );
  }
}
