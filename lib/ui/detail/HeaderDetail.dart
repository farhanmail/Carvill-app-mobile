import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HeaderDetail extends StatelessWidget {
  String merk;
  String gambar;

  HeaderDetail({
    this.merk,
    this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    // final formatter = NumberFormat("#,###");
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'http://192.168.100.9/app_villa/assets/upload/' + gambar,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$merk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 15.0,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Puncak',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 25.0,
              ),
            ),
          ],
        ),
        // ListView(
        //   children: <Widget>[
        //     Column(
        //       children: <Widget>[
        //         ListTile(
        //           title: Text(
        //             'Harga',
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // RichText(
        //   overflow: TextOverflow.ellipsis,
        //   text: TextSpan(
        //     style: Theme.of(context).textTheme.headline5.copyWith(
        //           fontWeight: FontWeight.bold,
        //         ),
        //     text: '$merk',
        //   ),
        // ),
        // SizedBox(
        //   width: 20.0,
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: Container(
        //         height: 175.0,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(
        //               'http://192.168.100.9/app_villa/assets/upload/' +
        //                   gambar,
        //             ),
        //             fit: BoxFit.fill,
        //           ),
        //           borderRadius: BorderRadius.circular(32.0),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey.withOpacity(0.2),
        //               spreadRadius: 3.0,
        //               blurRadius: 5.0,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
