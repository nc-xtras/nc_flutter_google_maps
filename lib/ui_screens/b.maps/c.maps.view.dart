part of '_index.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MapsAppbar(),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.black,
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
          Expanded(
            child: OnReactive(
              () => GoogleMap(
                initialCameraPosition: _ct.getCameraPosition(),
                onMapCreated: _sv.onMapCreated,
              ),
            ),
          )
        ],
      ),
    );
  }
}
