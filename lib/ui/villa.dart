import 'package:carvill/provider/VillaProvider.dart';
import 'package:carvill/ui/ListVilla.dart';
import 'package:carvill/ui/detail_villa.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VillaLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat('#,##0.00', 'idVilla');
    return RefreshIndicator(
      onRefresh: () => Provider.of<VillaProvider>(
        context,
        listen: false,
      ).getVilla(),
      color: Colors.blue[300],
      child: Container(
        margin: EdgeInsets.all(10),
        //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
        child: FutureBuilder(
          //DENGAN MENJALANKAN FUNGSI YANG SAMA
          future: Provider.of<VillaProvider>(context, listen: false).getVilla(),
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
                  height: 290.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.dataVilla.length,
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2,
                    //   mainAxisSpacing: 16,
                    //   crossAxisSpacing: 10,
                    //   childAspectRatio: 0.7,
                    // ),
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
                              Positioned(
                                bottom: 7.0,
                                child: Container(
                                  height: 120.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data.dataVilla[i].merk,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Harga: Rp.' +
                                              formater.format(int.parse(
                                                  data.dataVilla[i].harga)),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                        child: Image.network(
                                          'http://192.168.100.9/app_villa/assets/upload/' +
                                              data.dataVilla[i].gambar,
                                          fit: BoxFit.cover,
                                          height: 180.0,
                                          width: 220.0,
                                        ),
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// class Villa extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Villa',
//                 style: TextStyle(
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.5),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ListVilla();
//                       },
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Semua',
//                   style: TextStyle(
//                     color: Color(0xFF73AEF5),
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 1.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12.0),
//         Container(
//           height: 300.0,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: villaModel.length,
//             itemBuilder: (BuildContext context, int index) {
//               Destination destination = destinations[index];
//               return GestureDetector(
//                 // onTap: () => Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (_) => DetailVilla(
//                 //       destination: destination,
//                 //     ),
//                 //   ),
//                 // ),
//                 child: Container(
//                   margin: EdgeInsets.all(10.0),
//                   width: 210.0,
//                   child: Stack(
//                     alignment: Alignment.topCenter,
//                     children: <Widget>[
//                       Positioned(
//                         bottom: 7.0,
//                         child: Container(
//                           height: 120.0,
//                           width: 200.0,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(10.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   destination.nama,
//                                   style: TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.w600,
//                                       letterSpacing: 1.2),
//                                 ),
//                                 Text(
//                                   destination.description,
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               offset: Offset(0.0, 2.0),
//                               blurRadius: 6.0,
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             Hero(
//                               tag: destination.imageUrl,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 child: Image(
//                                   height: 180.0,
//                                   width: 220.0,
//                                   image: AssetImage(destination.imageUrl),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               left: 10.0,
//                               bottom: 10.0,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(
//                                         FontAwesomeIcons.locationArrow,
//                                         size: 10.0,
//                                         color: Colors.white,
//                                       ),
//                                       SizedBox(width: 5.0),
//                                       Text(
//                                         destination.country,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
// SizedBox(height: 12.0),

// Container(
//   height: 300.0,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: destinations.length,
//     itemBuilder: (BuildContext context, int index) {
//       Destination destination = destinations[index];
//       return GestureDetector(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => DestinationScreen(
//               destination: destination,
//             ),
//           ),
//         ),
//         child: Container(
//           margin: EdgeInsets.all(10.0),
//           width: 210.0,
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: <Widget>[
//               Positioned(
//                 bottom: 7.0,
//                 child: Container(
//                   height: 120.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           destination.city,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 1.2,
//                           ),
//                         ),
//                         Text(
//                           destination.description,
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0.0, 2.0),
//                       blurRadius: 6.0,
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     Hero(
//                       tag: destination.imageUrl,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0),
//                         child: Image(
//                           height: 180.0,
//                           width: 220.0,
//                           image: AssetImage(destination.imageUrl),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 10.0,
//                       bottom: 10.0,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Icon(
//                                 FontAwesomeIcons.locationArrow,
//                                 size: 10.0,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 5.0),
//                               Text(
//                                 destination.country,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// );
//   }
// }
