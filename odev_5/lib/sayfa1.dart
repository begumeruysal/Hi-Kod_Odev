import 'package:flutter/material.dart';

class Sayfa1 extends StatelessWidget {
  final String name;
  final String? gender;
  final bool isAdult;
  final bool smokes;
  final int? cigarettesPerDay;

  Sayfa1({
    required this.name,
    required this.gender,
    required this.isAdult,
    required this.smokes,
    this.cigarettesPerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Adınız ve Soyadınız: $name'),
              Text('Cinsiyetiniz: ${gender ?? "Belirtilmemiş"}'),
              Text('Reşit misiniz?: ${isAdult ? "Evet" : "Hayır"}'),
              Text('Sigara kullanıyor musunuz?: ${smokes ? "Evet" : "Hayır"}'),
              if (smokes)
                Text('Günde kaç tane sigara kullanıyorsunuz?: $cigarettesPerDay'),
            ],
          ),
        ),
      ),
    );
  }
}
