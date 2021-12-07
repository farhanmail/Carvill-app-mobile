import 'dart:convert';

import 'package:carvill/mainNavigation.dart';
import 'package:carvill/ui/Registrasi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post("http://192.168.100.9/api_villa/api/login",
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['username'];
    String namaAPI = data['nama'];
    String id = data['id_customer'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, namaAPI, usernameAPI, id);
      });
      print(pesan);
    } else {
      print(pesan);

      // _showAlertDialog(context, response['pesan']);
    }
  }

  _showAlertDialog(BuildContext context, String err) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  savePref(int value, String nama, String username, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/carvil.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.dstATop),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  top: 100.0,
                                  left: 50.0,
                                  right: 50.0,
                                  bottom: 50.0),
                              child: Center(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/carvil.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.0),
                            TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Username tidak boleh kosong";
                                }
                              },
                              onSaved: (e) => username = e,
                              decoration: InputDecoration(
                                labelText: "username",
                              ),
                            ),
                            SizedBox(height: 35.0),
                            TextFormField(
                              validator: (input) => input.length < 5
                                  ? "Password tidak boleh kurang dari 5 karakter"
                                  : null,
                              obscureText: _secureText,
                              onSaved: (e) => password = e,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: showHide,
                                  icon: Icon(_secureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 120),
                              onPressed: () {
                                check();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                              shape: StadiumBorder(),
                            ),
                            SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Belum punya Akun?',
                                  style: TextStyle(
                                    fontFamily: 'varela',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Register(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue[800],
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainNavigation(signOut);
        break;
    }
  }
}

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   String email, password, nama;
//   final _key = new GlobalKey<FormState>();

//   bool _secureText = true;

//   showHide() {
//     setState(() {
//       _secureText = !_secureText;
//     });
//   }

//   check() {
//     final form = _key.currentState;
//     if (form.validate()) {
//       form.save();
//       save();
//     }
//   }

//   save() async {
//     final response = await http.post(
//         "http://192.168.10.193/flutter.register.php",
//         body: {"nama": nama, "email": email, "password": password});
//     final data = jsonDecode(response.body);
//     int value = data['value'];
//     String pesan = data['message'];
//     if (value == 1) {
//       setState(() {
//         Navigator.pop(context);
//       });
//     } else {
//       print(pesan);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register"),
//       ),
//       body: Form(
//         key: _key,
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: <Widget>[
//             TextFormField(
//               validator: (e) {
//                 if (e.isEmpty) {
//                   return "Please insert fullname";
//                 }
//               },
//               onSaved: (e) => nama = e,
//               decoration: InputDecoration(labelText: "Nama Lengkap"),
//             ),
//             TextFormField(
//               validator: (e) {
//                 if (e.isEmpty) {
//                   return "Please insert email";
//                 }
//               },
//               onSaved: (e) => email = e,
//               decoration: InputDecoration(labelText: "email"),
//             ),
//             TextFormField(
//               obscureText: _secureText,
//               onSaved: (e) => password = e,
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 suffixIcon: IconButton(
//                   onPressed: showHide,
//                   icon: Icon(
//                       _secureText ? Icons.visibility_off : Icons.visibility),
//                 ),
//               ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return Register();
//                     },
//                   ),
//                 );
//                 ;
//               },
//               child: Text("Register"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MainMenu extends StatefulWidget {
//   final VoidCallback signOut;
//   MainMenu(this.signOut);
//   @override
//   _MainMenuState createState() => _MainMenuState();
// }

// class _MainMenuState extends State<MainMenu> {
//   final String url = 'https://192.168.0.17/api/api';
//   List
//       data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

//   Future<String> getData() async {
//     // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
//     var res = await http
//         .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

//     setState(() {
//       //RESPONSE YANG DIDAPATKAN DARI API TERSEBUT DI DECODE
//       var content = json.decode(res.body);
//       //KEMUDIAN DATANYA DISIMPAN KE DALAM VARIABLE data,
//       //DIMANA SECARA SPESIFIK YANG INGIN KITA AMBIL ADALAH ISI DARI KEY hasil
//       data = content['hasil'];
//     });
//     return 'success!';
//   }

//   signOut() {
//     setState(() {
//       widget.signOut();
//     });
//   }

// //  String email = "", nama = "";
// //  TabController tabController;

//   getPref() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
// //      email = preferences.getString("email");
// //      nama = preferences.getString("nama");
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getPref();
//     this.getData(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
//   }

//   int _currentIndex;
//   var page;

//   bool isLogin;

//   @override
//   void initStatee() {
//     _currentIndex = 0;
//     page = Home();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           textTheme: TextTheme(),
//           backgroundColor: Colors.white,
//           brightness: Brightness.dark,
//           elevation: 0.0,
//           centerTitle: true,
//           title: Container(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image(
//                 image: AssetImage('assets/images/carvil.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           actions: <Widget>[
//             IconButton(
//               onPressed: () {
//                 signOut();
//               },
//               icon: Icon(Icons.lock_open),
//             )
//           ],
//         ),
//         body: page,
//         bottomNavigationBar: bmnav.BottomNav(
//           color: Colors.white,
//           labelStyle: bmnav.LabelStyle(
//               visible: true,
//               showOnSelect: false,
//               onSelectTextStyle: TextStyle(
//                 color: Colors.grey,
//                 height: 1.8,
//               ),
//               textStyle: TextStyle(
//                 color: Colors.grey,
//                 height: 1.8,
//               )),
//           iconStyle: bmnav.IconStyle(
//               color: Colors.grey[400], onSelectSize: 22.0, size: 22.0),
//           elevation: 6.0,
//           onTap: (i) {
//             _currentIndex = i;
//             _currentPage(i);
//           },
//           index: _currentIndex,
//           items: [
//             bmnav.BottomNavItem(Icons.home, label: 'Home'),
//             bmnav.BottomNavItem(Icons.assessment, label: 'Transaksi'),
//             bmnav.BottomNavItem(Icons.person, label: 'Akun'),
//           ],
//         ),
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
