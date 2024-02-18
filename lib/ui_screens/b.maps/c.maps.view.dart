part of '_index.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MapsFab(),
      body: Stack(
        children: [
          OnReactive(
            () => GoogleMap(
              initialCameraPosition: _ct.getCameraPosition(),
              onMapCreated: _sv.onMapCreated,
              mapType: _dt.rxMapType.st,
              onCameraIdle: () => _ct.onCameraIdle(),
              polygons: _dt.rxPolygons.st,
              zoomControlsEnabled: false,
              compassEnabled: true,
            ),
          ),
          const MapsButtons(),
        ],
      ),
    );
  }
}
