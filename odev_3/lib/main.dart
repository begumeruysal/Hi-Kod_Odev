import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Odev',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFBDF5F2), // Ana ekran renk alanı
          appBar: AppBar( // AppBar
            backgroundColor: Colors.indigo, // AppBar rengi
            title: Text(
              "Hi-Kod",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true, // Text ortalanmış
            actions: [
              IconButton(
                icon: Icon(Icons.person), //iconbuton içine başa da sona da konabiliyor
                color: Color(0xFFBDF5F2),//ikon rengi
                onPressed: () {//basılınca çıkacak yazı
                  print('İnsan ikonuna tıklandı!');
                },
              ),
            ],
            leading: IconButton(
              color:Colors.white,
              onPressed: () {
                print('Menü butonuna tıklandı!');
              },
              icon: Icon(Icons.menu),
            ),
          ),
          body: Center( //appbar altı ana kısım
            child: Container(
              height: 110,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.indigo, //container rengi
                borderRadius: BorderRadius.circular(50.0),//kenar yumşatması max 50
              ),
              child: Center(
                child: Text(
                  "Hello World",
                  style: TextStyle(
                    color: Color(0xFFBDF5F2),
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
