import 'dart:math';

import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.maps.prov.dart';
part 'b.maps.serv.dart';
part 'c.maps.repo.dart';
part 'd.maps.repo.mock.dart';

MapsProv get _pv => Prov.maps.st;
MapsServ get _sv => Serv.maps;
MapsRepo get _rp => Repo.maps.st;
