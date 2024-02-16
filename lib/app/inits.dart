part of '_index.dart';

Future<void> inits() async {
  WidgetsFlutterBinding.ensureInitialized();

  logx.wtf('inits start');

  Serv.sample.init();
  Serv.maps.init();

  logx.wtf('inits success');
}
