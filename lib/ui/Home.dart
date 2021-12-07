import 'package:carvill/ui/villa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: TextTheme(),
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        elevation: 0.0,
        centerTitle: true,
        title: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: AssetImage('assets/images/carvil.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'BOOKING VILLA LEBIH MUDAH DAN DAPATKAN CASHBACK HINGGA 20%',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'SEKILAS',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            VillaLayout(),
            SizedBox(height: 12.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'VIEW',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(
                  image: AssetImage('assets/images/villa1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Text(
                'Menghadirkan suasana dengan view yang indah membuat pikiran fresh dan tenang, serta dimanjakan dengan pemandangan alam di sekitar, seperti kebun Teh dan Pegunungan, juga bisa melakukan camping di area sekitar villa serta bisa menikmati Api unggun yang telah di sediakan. Jadi bagi anda yang sedang mencari tempat penginapan di daerah puncak disni lah solusinya.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'LOKASI YANG STRATEGIS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(
                  image: AssetImage('assets/images/villa2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                'Berada di lokasi yang sangat strategis yaitu di kawasan wisata Puncak Pas. Bermalam di sini akan terasa sangat nyaman karena selain bersih, kawasannya juga terasa sejuk dengan rimbunan bunga-bunga yang mengelilinginya. Selain fasilitas utama, villa ini juga dilengkapi dengan fasilitas pendukung seperti sofa, alat-alat dapur modern, kulkas, TV layar datar, dan lemari.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: _icons
            //       .asMap()
            //       .entries
            //       .map(
            //         (MapEntry map) => _buildIcon(map.key),
            //       )
            //       .toList(),
            // ),
            SizedBox(height: 20.0),
            // VillaLayout(),
            // SizedBox(height: 12.0),
            // HotelLayout(),
          ],
        ),
      ),
    );
  }
}
