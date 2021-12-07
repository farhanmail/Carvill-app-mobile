import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Deskripsi extends StatelessWidget {
  String kodeType;
  String noVilla;
  String noTelp;
  String warna;
  String lokasi;
  String status;
  String harga;
  String fasilitas;

  Deskripsi({
    this.kodeType,
    this.noTelp,
    this.noVilla,
    this.warna,
    this.lokasi,
    this.status,
    this.harga,
    this.fasilitas,
  });

  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat('#,##0.00', 'idVilla');
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Harga ',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Rp. " + formater.format(int.parse(harga)),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                new Divider(
                  height: 20.0,
                  color: Colors.blueGrey,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Alamat',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text('$lokasi'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffE6F2FD),
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
            child: Text(
              "Deskripsi Villa",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.only(bottom: 20),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Fasilitas yang Tersedia :',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text('$fasilitas'),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PilihanTombol('TELEPON', () async {
                await call('$noTelp');
              }),
              PilihanTombol('WHATSAPP', () async {
                await chatWa(
                    'https://api.whatsapp.com/send?phone=$noTelp&text=SELAMAT%20DATANG%20DI%20CHATT%20CARVILL.%0A%0A');
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class PilihanTombol extends StatelessWidget {
  final String text;
  final Function onTap;

  PilihanTombol(this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 135.0,
        child: RaisedButton(
          child: Text(text),
          color: Colors.green[200],
          onPressed: onTap,
        ));
  }
}

Future<void> call(String phoneNumber) async {
  await launch('tel:$phoneNumber');
}

Future<void> chatWa(
  String urlWa, {
  bool forceWebView = true,
  bool enableJavaSript = true,
}) async {
  await launch(urlWa);
}
