import 'package:carvill/model/VillaModel.dart';
import 'package:carvill/provider/VillaProvider.dart';
import 'package:carvill/ui/detail/Deskripsi.dart';
import 'package:carvill/ui/detail/HeaderDetail.dart';
import 'package:carvill/ui/detail/Merk.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Detail extends StatefulWidget {
  String kodeType;
  String merk;
  String noVilla;
  String noTelp;
  String warna;
  String lokasi;
  String status;
  String harga;
  String fasilitas;
  String gambar;

  Detail({
    this.kodeType,
    this.merk,
    this.noTelp,
    this.noVilla,
    this.warna,
    this.lokasi,
    this.status,
    this.harga,
    this.fasilitas,
    this.gambar,
  });

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int numQty = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                HeaderDetail(
                  merk: widget.merk,
                  gambar: widget.gambar,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Deskripsi(
                    kodeType: widget.kodeType,
                    noVilla: widget.noVilla,
                    noTelp: widget.noTelp,
                    warna: widget.warna,
                    lokasi: widget.lokasi,
                    status: widget.status,
                    harga: widget.harga,
                    fasilitas: widget.fasilitas,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class DetailVilla extends StatefulWidget {
//   final String idVilla;
//   DetailVilla({this.idVilla});

//   @override
//   _DetailVillaState createState() => _DetailVillaState();
// }

// class _DetailVillaState extends State<DetailVilla> {
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _salary = TextEditingController();
//   final TextEditingController _age = TextEditingController();
//   bool _isLoading = false;

//   final snackbarKey = GlobalKey<ScaffoldState>();

//   FocusNode salaryNode = FocusNode();
//   FocusNode ageNode = FocusNode();

//   @override
//   void initState() {
//     Future.delayed(
//       Duration.zero,
//       () {
//         Provider.of<VillaProvider>(context, listen: false)
//             .findEmployee(widget.idVilla)
//             .then(
//           (response) {
//             _name.text = response.merk;
//             _salary.text = response.harga;
//             _age.text = response.lokasi;
//           },
//         );
//       },
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: snackbarKey,
//       appBar: AppBar(
//         textTheme: TextTheme(),
//         backgroundColor: Colors.white,
//         brightness: Brightness.dark,
//         elevation: 0.0,
//         centerTitle: true,
//         title: Container(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image(
//               image: AssetImage('assets/images/carvil.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             TextField(
//               controller: _name,
//             ),
//             TextField(
//               controller: _salary,
//               focusNode: salaryNode,
//               decoration: InputDecoration(
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.pinkAccent,
//                   ),
//                 ),
//                 hintText: 'Gaji',
//               ),
//               onSubmitted: (_) {
//                 FocusScope.of(context).requestFocus(ageNode);
//               },
//             ),
//             TextField(
//               controller: _age,
//               focusNode: ageNode,
//               decoration: InputDecoration(
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.pinkAccent,
//                   ),
//                 ),
//                 hintText: 'Umur',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
