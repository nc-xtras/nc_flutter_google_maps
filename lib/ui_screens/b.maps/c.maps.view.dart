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
          const MapsButtons(),
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
