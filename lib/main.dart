// import 'package:carvill/Splashscreen.dart';
import 'package:carvill/Splashscreen.dart';
import 'package:carvill/provider/VillaProvider.dart';
import 'package:carvill/ui/ListVilla.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VillaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF29B6F6),
          accentColor: Color(0xFFB3E5FC),
          scaffoldBackgroundColor: Color(0xFFE3F2FD),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'splash screen',
//     theme: ThemeData(
//       primaryColor: Color(0xFF29B6F6),
//       accentColor: Color(0xFFB3E5FC),
//       scaffoldBackgroundColor: Color(0xFFE3F2FD),
//     ),
//     home: SplashScreen(),
//   ));
// }

// import 'package:carvill/Splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// // import 'models/Mahasiswa_m.dart';

// void main() {
//   runApp(MaterialApp(
//     home: SplashScreen(),
//     theme: ThemeData(),
//   ));
// }
