import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors, must_be_immutable
class HomePage extends StatefulWidget {
  // String tanggal_jam;
  // String nik;
  // String mesin;
  // String panjang;
  // HomePage(this.tanggal_jam, this.nik, this.mesin, this.panjang);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tanggal_jam = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController mesin = TextEditingController();
  TextEditingController panjang = TextEditingController();

  // void printaja() {
  //   print('coba');
  // }

  Future<void> _simpan() async {
    // ignore: unused_local_variable
    final response = await http.post(
        Uri.parse("http://192.168.96.136:8000/api/doctorblade"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          "tanggal/jam": tanggal_jam.text,
          "nik": nik.text,
          "mesin": mesin.text,
          "panjang": panjang.text
        }));
    print(response.body);
    if (response.statusCode != 201) {
    } else {
      setState(() {
        tanggal_jam.clear();
        nik.clear();
        mesin.clear();
        panjang.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Doctor Blade'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'assets/pmrk.png',
              width: 100,
              height: 100,
            ),
            // ignore: prefer_const_constructors
            TextField(
              controller: tanggal_jam,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  hintText: "Tanggal/jam",
                  labelText: "Tanggal/Jam",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black)),
              //keyboardType: TextInputType.number,
            ),
            // ignore: prefer_const_constructors
            TextField(
              controller: nik,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  hintText: "NIK",
                  labelText: "NIK",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black)),
              //keyboardType: TextInputType.number,
            ),
            // ignore: prefer_const_constructors
            TextField(
              controller: mesin,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  hintText: "No Mesin",
                  labelText: "No Mesin",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black)),
              //keyboardType: TextInputType.number,
            ),
            // ignore: prefer_const_constructors
            TextField(
              controller: panjang,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  hintText: "Panjang",
                  labelText: "Panjang",
                  // ignore: prefer_const_constructors
                  labelStyle: TextStyle(fontSize: 24, color: Colors.black)),
              //keyboardType: TextInputType.number,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                _simpan();
                //printaja();
              },
              // ignore: prefer_const_constructors
              shape: RoundedRectangleBorder(
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              // ignore: prefer_const_constructors
              child: Text(
                "SAVE",
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
