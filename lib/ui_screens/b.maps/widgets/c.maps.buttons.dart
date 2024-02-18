part of '../_index.dart';

class MapsButtons extends StatelessWidget {
  const MapsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: OnBuilder.all(
        listenTo: _dt.rxPegatBatumbukList,
        onWaiting: () => const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error, refreshError) => Text('Error: $error'),
        onData: (data) {
          return Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 5,
            children: [
              ...List.generate(data.length, (index) {
                String id = data[index].properties.name;
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
    );
  }
}
