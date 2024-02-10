part of '_index.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MapsAppbar(),
      ),
      floatingActionButton: MapsFab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MapsCharlie(),
            MapsDelta(),
            MapsEcho(),
          ],
        ),
      ),
    );
  }
}
