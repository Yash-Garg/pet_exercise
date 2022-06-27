import 'package:flutter/cupertino.dart';
import 'package:petperfect_exercise/app/app.dart';
import 'package:petperfect_exercise/bootstrap.dart';
import 'package:petperfect_exercise/di/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  bootstrap(() => const App());
}
