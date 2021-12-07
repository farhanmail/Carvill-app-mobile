import 'package:carvill/model/VillaModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VillaProvider extends ChangeNotifier {
  //DEFINISIKAN PRIVATE VARIABLE DENGAN TYPE List dan VALUENYA MENGGUNAKAN FORMAT VillaModel
  //DEFAULTNYA KITA BUAT KOSONG
  List<VillaModel> _data = [];
  //KARENA PRIVATE VARIABLE TIDAK BISA DIAKSES OLEH CLASS/FILE LAINNYA, MAKA DIPERLUKAN GETTER YANG BISA DIAKSES SECARA PUBLIC, ADAPUN VALUENYA DIAMBIL DARI _DATA
  List<VillaModel> get dataVilla => _data;

  //BUAT FUNGSI UNTUK MELAKUKAN REQUEST DATA KE SERVER / API
  Future<List<VillaModel>> getVilla() async {
    final url = 'http://192.168.100.9/api_villa/api/';
    final response = await http.get(url); //LAKUKAN REQUEST DATA

    //JIKA STATUSNYA BERHASIL ATAU = 200
    if (response.statusCode == 200) {
      //MAKA KITA FORMAT DATANYA MENJADI MAP DENGNA KEY STRING DAN VALUE DYNAMIC
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      //KEMUDIAN MAPPING DATANYA UNTUK KEMUDIAN DIUBAH FORMATNYA SESUAI DENGAN VillaModel DAN DIPASSING KE DALAM VARIABLE _DATA
      _data =
          result.map<VillaModel>((json) => VillaModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }

  Future<List<VillaModel>> getDetailEmployee() async {
    final url = 'http://192.168.100.9/api_villa/api/';
    final response = await http.get(url); //LAKUKAN REQUEST DATA

    //JIKA STATUSNYA BERHASIL ATAU = 200
    if (response.statusCode == 200) {
      //MAKA KITA FORMAT DATANYA MENJADI MAP DENGNA KEY STRING DAN VALUE DYNAMIC
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      //KEMUDIAN MAPPING DATANYA UNTUK KEMUDIAN DIUBAH FORMATNYA SESUAI DENGAN VillaModel DAN DIPASSING KE DALAM VARIABLE _DATA
      _data =
          result.map<VillaModel>((json) => VillaModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }

  Future<VillaModel> findEmployee(String idVilla) async {
    return _data.firstWhere((i) =>
        i.idVilla ==
        idVilla); //JADI KITA CARI DATA BERDASARKAN ID DAN DATA PERTAMA AKAN DISELECT
  }

  Future<bool> updateEmployee(id, name, salary, age) async {
    final url = 'http://employee-crud-flutter.daengweb.id/update.php';
    final response = await http.post(url, body: {
      'id': id,
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age
    });

    final result = json.decode(response.body);
    if (response.statusCode == 200 && result['status'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }
}
