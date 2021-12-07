import 'dart:convert';

import 'package:carvill/ui/Akun.dart';
import 'package:carvill/ui/Home.dart';
import 'package:carvill/ui/ListVilla.dart';
import 'package:carvill/ui/Villa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:shared_preferences/shared_preferences.dart';

// class MainNavigation extends StatefulWidget {
//   @override
//   _MainNavigationState createState() => _MainNavigationState();
// }

// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex;
//   var page;

//   bool isLogin;

//   @override
//   void initState() {
//     _currentIndex = 0;
//     page = Home();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(isLogin);
//     return Scaffold(
//       body: page,
//       bottomNavigationBar: bmnav.BottomNav(
//         color: Colors.white,
//         labelStyle: bmnav.LabelStyle(
//             visible: true,
//             showOnSelect: false,
//             onSelectTextStyle: TextStyle(
//               color: Colors.grey,
//               height: 1.8,
//             ),
//             textStyle: TextStyle(
//               color: Colors.grey,
//               height: 1.8,
//             )),
//         iconStyle: bmnav.IconStyle(
//             color: Colors.grey[400], onSelectSize: 22.0, size: 22.0),
//         elevation: 6.0,
//         onTap: (i) {
//           _currentIndex = i;
//           _currentPage(i);
//         },
//         index: _currentIndex,
//         items: [
//           bmnav.BottomNavItem(Icons.home, label: 'Home'),
//           bmnav.BottomNavItem(Icons.assessment, label: 'Transaksi'),
//           bmnav.BottomNavItem(Icons.person, label: 'Akun'),
//         ],
//       ),
//     );
//   }

//   void _currentPage(int i) {
//     if (i == 0) {
//       setState(() {
//         page = Home();
//       });
//     } else if (i == 1) {
//       setState(() {
//         page = ListVilla();
//       });
//     } else {
//       setState(() {
//         // page = Akun();
//       });
//     }
//   }
// }

class MainNavigation extends StatefulWidget {
  final VoidCallback signOut;
  MainNavigation(this.signOut);
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final String url = 'https://192.168.0.17/api/api';
  List
      data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future<String> getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      //RESPONSE YANG DIDAPATKAN DARI API TERSEBUT DI DECODE
      var content = json.decode(res.body);
      //KEMUDIAN DATANYA DISIMPAN KE DALAM VARIABLE data,
      //DIMANA SECARA SPESIFIK YANG INGIN KITA AMBIL ADALAH ISI DARI KEY hasil
      data = content['hasil'];
    });
    return 'success!';
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

//  String email = "", nama = "";
//  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
//      email = preferences.getString("email");
//      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    _currentIndex = 0;
    page = Home();
    // TODO: implement initState
    super.initState();
    // getPref();
    // this.getData(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }

  int _currentIndex;
  var page;

  bool isLogin;

  // @override
  // void initState() {
  //   _currentIndex = 0;
  //   page = Home();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: page,
        bottomNavigationBar: bmnav.BottomNav(
          color: Colors.white,
          labelStyle: bmnav.LabelStyle(
              visible: true,
              showOnSelect: false,
              onSelectTextStyle: TextStyle(
                color: Colors.grey,
                height: 1.8,
              ),
              textStyle: TextStyle(
                color: Colors.grey,
                height: 1.8,
              )),
          iconStyle: bmnav.IconStyle(
              color: Colors.grey[400], onSelectSize: 22.0, size: 22.0),
          elevation: 6.0,
          onTap: (i) {
            _currentIndex = i;
            _currentPage(i);
          },
          index: _currentIndex,
          items: [
            bmnav.BottomNavItem(Icons.home, label: 'Home'),
            bmnav.BottomNavItem(Icons.account_balance, label: 'Villa'),
            bmnav.BottomNavItem(Icons.person, label: 'Akun'),
          ],
        ),
      ),
    );
  }

  void _currentPage(int i) {
    if (i == 0) {
      setState(() {
        page = Home();
      });
    } else if (i == 1) {
      setState(() {
        page = ListVilla();
      });
    } else {
      setState(() {
        page = Akun(signOut);
      });
    }
  }
}
