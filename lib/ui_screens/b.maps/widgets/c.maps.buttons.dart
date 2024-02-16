part of '../_index.dart';

class MapsButtons extends StatelessWidget {
  const MapsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 50,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OnBuilder.all(
              listenTo: _dt.rxVector,
              onWaiting: () => const Center(
                child: CircularProgressIndicator(),
              ),
              onError: (error, refreshError) => Text('Error: $error'),
              onData: (data) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(data.length, (index) {
                      String id = data[index].id;
                      return ElevatedButton(
                        onPressed: () {
                          _ct.setMapFitToPolygon(id);
                        },
                        child: Text(id),
                      );
                    }),
                  ],
                );
              },
            ),
            OnReactive(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _ct.updateBearing(-90);
                    },
                    child: const Text('Rotate -90'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _ct.updateBearing(90);
                    },
                    child: const Text('Rotate 90'),
                  ),
                  OutlinedButton(
                    onPressed: _dt.rxTilt.st == 0
                        ? () {
                            _ct.updateTilt(90);
                          }
                        : null,
                    child: const Text('tilt 90'),
                  ),
                  OutlinedButton(
                    onPressed: _dt.rxTilt.st != 0
                        ? () {
                            _ct.updateTilt(0);
                          }
                        : null,
                    child: const Text('tilt 0'),
                  ),
                  OutlinedButton(
                    onPressed: _dt.rxZoom.st < 21
                        ? () {
                            _ct.updateZoom(3);
                          }
                        : null,
                    child: const Text('zoom in'),
                  ),
                  OutlinedButton(
                    onPressed: _dt.rxZoom.st > 0
                        ? () {
                            _ct.updateZoom(-3);
                          }
                        : null,
                    child: const Text('zoom out'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _ct.changeMapType(MapType.normal);
                    },
                    child: const Text('normal'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _ct.changeMapType(MapType.terrain);
                    },
                    child: const Text('terrain'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _ct.changeMapType(MapType.hybrid);
                    },
                    child: const Text('hybrid'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
