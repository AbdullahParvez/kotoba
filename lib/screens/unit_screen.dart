import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba/screens/set_screen.dart';
import 'package:kotoba/widgets/item_grid.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/vocab.dart';
import '../providers/provider.dart';

class UnitScreen extends ConsumerStatefulWidget {
  const UnitScreen({super.key, required this.level});
  final int level;

  @override
  ConsumerState<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends ConsumerState<UnitScreen> {
  // List<Unit> _units = [];
  bool showSpinner = false;
  loadLevel()  {
    // List<Unit> units = await fetchAllUnitByLevel(widget.level);
    ref.read(unitProvider.notifier).loadUnit(widget.level);

  }

  @override
  initState() {
    setState(() {
      showSpinner=true;
    });
    loadLevel();
    super.initState();
  }

  void onSelectCard(int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SetScreen(unit: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // for (var u in _units){
    //   print(u.no.toString());
    // }
    List<Unit> units = ref.watch(unitProvider);
    if (units.isNotEmpty){
      setState(() {
        showSpinner = false;
      });
    }
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Unit"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            for (var u in units)
              GridItem(
                  level: u.no.toString(),
                  id: u.id,
                  color: Colors.deepPurpleAccent,
                  onSelectCard: onSelectCard),
          ],
        ),
      ),
    );
  }
}
