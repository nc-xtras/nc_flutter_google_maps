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
        child: Center(
          child: OnReactive(
            () => Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 5,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
