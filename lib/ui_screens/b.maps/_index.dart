import 'dart:math';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.maps.data.dart';
part 'b.maps.ctrl.dart';
part 'c.maps.view.dart';
part 'widgets/a.maps.appbar.dart';
part 'widgets/b.maps.fab.dart';
part 'widgets/c.maps.charlie.dart';
part 'widgets/d.maps.delta.dart';
part 'widgets/e.maps.echo.dart';

MapsData get _dt => Data.maps.st;
MapsCtrl get _ct => Ctrl.maps;
