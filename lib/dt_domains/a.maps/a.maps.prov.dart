part of '_index.dart';

class MapsProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final rxSelectedId = ''.inj();

  final rxPolygons = RM.inject<Set<Polygon>>(
    () => HashSet<Polygon>(),
    autoDisposeWhenNotUsed: false,
  );

  final rxVectors = RM.injectFuture<List<Vector>>(
    () => Future.value([]),
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      initState: () => _sv.initVectors(),
      onSetState: (snap) {
        if (snap.hasData) {
          _sv.vectorsToPolygons(snap.data!);
        }
      },
    ),
  );

  final rxGmapCompleter = RM.inject<Completer<GoogleMapController>>(
    () => Completer<GoogleMapController>(),
    autoDisposeWhenNotUsed: false,
  );

  final rxGmapController = RM.inject<GoogleMapController?>(() => null);

  final rxTarget = RM.inject<LatLng>(
    () => const LatLng(-0.587381208074135, 117.54252383379),
    autoDisposeWhenNotUsed: false,
  );

  final rxMapType = RM.inject<MapType>(
    () => MapType.hybrid,
    autoDisposeWhenNotUsed: false,
  );

  final rxBearing = RM.inject<double>(
    () => 0.0,
    autoDisposeWhenNotUsed: false,
  );

  final rxTilt = RM.inject<double>(
    () => 0.0,
    autoDisposeWhenNotUsed: false,
  );

  final rxZoom = RM.inject<double>(
    () => kIsWeb ? 3 : 0.0, //web has default zoom level
    autoDisposeWhenNotUsed: false,
  );
}
