import 'package:carvill/provider/VillaProvider.dart';
import 'package:carvill/ui/detail_villa.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListVilla extends StatelessWidget {
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
      body: RefreshIndicator(
        onRefresh: () => Provider.of<VillaProvider>(
          context,
          listen: false,
        ).getVilla(),
        color: Colors.blue[300],
        child: Container(
          //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
          child: FutureBuilder(
            //DENGAN MENJALANKAN FUNGSI YANG SAMA
            future:
                Provider.of<VillaProvider>(context, listen: false).getVilla(),
            builder: (context, snapshot) {
              //JIKA PROSES REQUEST MASIH BERLANGSUNG
              if (snapshot.connectionState == ConnectionState.waiting) {
                //MAKA KITA TAMPILKAN INDIKATOR LOADING
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
              //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
              //MAKA KITA GUNAKAN CONSUMER
              return Consumer<VillaProvider>(
                builder: (context, data, _) {
                  //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.dataVilla.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Detail(
                                  kodeType: data.dataVilla[i].kodeType,
                                  merk: data.dataVilla[i].merk,
                                  noTelp: data.dataVilla[i].noTelp,
                                  noVilla: data.dataVilla[i].noVilla,
                                  warna: data.dataVilla[i].warna,
                                  lokasi: data.dataVilla[i].lokasi,
                                  harga: data.dataVilla[i].harga,
                                  fasilitas: data.dataVilla[i].fasilitas,
                                  gambar: data.dataVilla[i].gambar,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: 210.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          child: Image.network(
                                            'http://192.168.100.9/app_villa/assets/upload/' +
                                                data.dataVilla[i].gambar,
                                            fit: BoxFit.cover,
                                            height: 200.0,
                                            width: 300.0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              data.dataVilla[i].merk,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons
                                                      .locationArrow,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  'Puncak',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataVilla
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
