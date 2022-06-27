import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:petperfect_exercise/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  usesNullSafety: true,
)
void configureDependencies() => $initGetIt(getIt);
