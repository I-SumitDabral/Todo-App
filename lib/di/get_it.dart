import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final GetIt getItInstance = GetIt.I;

Future init() async {
  if (kDebugMode) {
    print('integration worked');
  }
}
