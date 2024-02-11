part of '_index.dart';

class MapsProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final rxGmapCompleter =
      RM.inject<Completer<GoogleMapController>>(() => Completer<GoogleMapController>(), autoDisposeWhenNotUsed: false);

  final rxGmapController = RM.inject<GoogleMapController?>(() => null);

  final rxTarget = RM.inject<LatLng>(
    () => const LatLng(-7.319563, 108.202972),
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
