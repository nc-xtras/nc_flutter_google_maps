part of '../_index.dart';

class MapsFab extends StatelessWidget {
  const MapsFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OnReactive(
                () => FloatingActionButton(
                  onPressed: !kIsWeb ? () => _ct.updateTilt(_dt.rxTilt.st == 0 ? 90 : 0) : null,
                  child: Text(_dt.rxTilt.st == 0 ? 'tilt 90' : 'tilt 0'),
                ),
              ),
              OnReactive(
                () => Row(
                  children: [
                    FloatingActionButton(
                      heroTag: null,
                      mini: true,
                      onPressed: !kIsWeb ? () => _ct.updateBearing(90) : null,
                      child: const Icon(Icons.rotate_90_degrees_ccw),
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      mini: true,
                      onPressed: !kIsWeb ? () => _ct.updateBearing(-90) : null,
                      child: const Icon(Icons.rotate_90_degrees_cw_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          OnReactive(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  shape: const CircleBorder(),
                  heroTag: null,
                  mini: true,
                  onPressed: () {
                    _ct.changeMapType();
                  },
                  child: Image.asset('assets/images/earth.png'),
                ),
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  onPressed: _dt.rxZoom.st < 21
                      ? () {
                          _ct.updateZoom(3);
                        }
                      : null,
                  child: const Icon(Icons.zoom_in),
                ),
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  onPressed: _dt.rxZoom.st > 0
                      ? () {
                          _ct.updateZoom(-3);
                        }
                      : null,
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
