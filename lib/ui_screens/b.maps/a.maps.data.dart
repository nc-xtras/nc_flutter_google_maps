part of '_index.dart';

class MapsData {
  final rxTitle = 'Maps'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxTarget = _pv.rxTarget;

  final rxBearing = _pv.rxBearing;

  final rxTilt = _pv.rxTilt;

  final rxZoom = _pv.rxZoom;

  final rxMapType = _pv.rxMapType;

  final rxVector = _pv.rxVectors;

  final rxPolygons = _pv.rxPolygons;

  final rxPegatBatumbukList = _pv.rxPegatBatumbukList;
}
