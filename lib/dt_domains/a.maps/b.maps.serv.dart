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

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) async {
        logx.wtf('ERROR: $error');
        await Geolocator.requestPermission();
      },
    );
    final currentLocation = await Geolocator.getCurrentPosition();
    _pv.rxTarget.st = LatLng(currentLocation.latitude, currentLocation.longitude);
    return currentLocation;
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

  onCameraIdle() async {
    GoogleMapController controller;
    if (_pv.rxGmapCompleter.st.isCompleted) {
      logz.wtf("onMapCreated is called after the Google Map has been created");
      controller = _pv.rxGmapController.st!;
    } else {
      logz.wtf("attempting to complete the process");
      controller = await _pv.rxGmapCompleter.st.future;
    }
    _pv.rxZoom.st = await controller.getZoomLevel();
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

  changeMapType(MapType type) {
    _pv.rxMapType.st = type;
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

  void setMapFitToPoligon(String id) {
    final polygon = _pv.rxPolygons.st.firstWhere((element) => element.polygonId.value == id);

    var minLatitude = polygon.points.first.latitude;
    var minLongitude = polygon.points.first.longitude;
    var maxLatitude = polygon.points.first.latitude;
    var maxLongitude = polygon.points.first.longitude;

    for (var point in polygon.points) {
      if (point.latitude < minLatitude) minLatitude = point.latitude;
      if (point.latitude > maxLatitude) maxLatitude = point.latitude;
      if (point.longitude < minLongitude) minLongitude = point.longitude;
      if (point.longitude > maxLongitude) maxLongitude = point.longitude;
    }

    _pv.rxGmapController.st?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLatitude, minLongitude),
          northeast: LatLng(maxLatitude, maxLongitude),
        ),
        20,
      ),
    );
  }

  Future<dynamic> initVectors() async {
    _pv.rxVectors.stateAsync = _rp.loadVectors();
  }

  vectorsToPolygons(List<Vector> data) {
    Set<Polygon> polygons = HashSet<Polygon>();
    for (var i = 0; i < data.length; i++) {
      var buf1 = data[i].latlngs.split(' ');
      List<LatLng> points = [];
      logz.wtf(buf1.toString());
      for (var el in buf1) {
        var buf2 = el.split(',');
        var lat = double.parse(buf2[0]);
        var lng = double.parse(buf2[1]);
        points.add(LatLng(lng, lat));
      }
      polygons.add(
        Polygon(
          polygonId: PolygonId(data[i].id),
          points: points,
          fillColor: Colors.orange.withOpacity(0.3),
          strokeColor: Colors.orange,
          geodesic: true,
          strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () => _pv.rxSelectedId.st = data[i].id,
          visible: true,
        ),
      );
      _pv.rxPolygons.st = polygons;
    }
  }
}
