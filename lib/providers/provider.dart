import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database_helper.dart';
import '../models/vocab.dart';

class SetNotifier extends StateNotifier<List<QuestionSet>> {
  SetNotifier() : super([]);

  void loadSet(unit) async {
    List<QuestionSet> sets = await fetchAllSetByUnit(unit);
    state = sets;
  }
}

final setProvider = StateNotifierProvider<SetNotifier, List<QuestionSet>>((ref) {
  return SetNotifier();
});

class UnitNotifier extends StateNotifier<List<Unit>> {
  UnitNotifier() : super([]);

  void loadUnit(level) async {
    List<Unit> units = await fetchAllUnitByLevel(level);
    // print(level);
    // print(units);
    state = units;
  }

}

final unitProvider = StateNotifierProvider<UnitNotifier, List<Unit>>((ref) {
  return UnitNotifier();
});
