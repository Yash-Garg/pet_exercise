import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:petperfect_exercise/app/app.dart';
import 'package:petperfect_exercise/bootstrap.dart';
import 'package:petperfect_exercise/data/injection/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  configureDependencies();
  bootstrap(() => const App());
}
