part of '_index.dart';

class MapsCtrl {
  init() => logxx.i(MapsCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  CameraPosition getCameraPosition() => _sv.getCameraPosition();

  updateBearing(double degree) => _sv.updateBearing(degree);

  onMapCreated(GoogleMapController controller) => _sv.onMapCreated(controller);

  updateTilt(double degree) => _sv.updateTilt(degree);

  updateZoom(double level) => _sv.updateZoom(level);

  changeMapType() => _sv.changeMapType();

  onCameraIdle() => _sv.onCameraIdle();

  setMapFitToPolygon(String id) => _sv.setMapFitToPoligon(id);
}
