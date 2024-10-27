import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kotoba/data/database_helper.dart';
import 'package:kotoba/screens/home_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    loadDb();
  }

 Future<bool> loadDb() async {
    bool created = await createDatabase();
    if (!mounted) return false;
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const HomeScreen();
    }));
    return created;
  }

  @override
  Widget build(BuildContext context) {
    // loadVocab();
    return const Scaffold(
        body: Center(

          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
        ),
    );
  }
}

// class JLPTLevelDisplayWidget extends StatelessWidget {
//   const JLPTLevelDisplayWidget(
//       {super.key, required this.jlptLevel, required this.level});
//   final String jlptLevel;
//   final int level;
//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       height: 80,
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.blue,
//           ),
//           gradient: const LinearGradient(
//             colors: <Color>[
//               Color(0xFF1976D2),
//               Color(0xFF42A5F5),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15)),
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (ctx) => UnitScreen(level: level),
//             ),
//           );
//         },
//         borderRadius: BorderRadius.circular(15),
//         child: Center(
//           child: Text(
//             jlptLevel,
//             style: const TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
