import 'package:flutter/material.dart';
import 'sayfa1.dart';

void main() {
  runApp(IlkUygulamam());
}

class IlkUygulamam extends StatefulWidget {
  const IlkUygulamam({Key? key}) : super(key: key);

  @override
  State<IlkUygulamam> createState() => _IlkUygulamamState();
}

class _IlkUygulamamState extends State<IlkUygulamam> {
  TextEditingController _nameController = TextEditingController();
  String? _selectedGender;
  bool _isAdult = false;
  bool _smokes = false;
  double _cigarettesPerDay = 0;

  void _submitForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Sayfa1(
          name: _nameController.text,
          gender: _selectedGender,
          isAdult: _isAdult,
          smokes: _smokes,
          cigarettesPerDay: _smokes ? _cigarettesPerDay.round() : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kişilik Anketi'),
          backgroundColor: Colors.lightGreenAccent,
          shadowColor: Colors.black,
          titleSpacing: 25,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Adınız ve soyadınız'),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      hint: Text('Cinsiyetinizi Seçiniz'),
                      value: _selectedGender,
                      onChanged: (_gender) {
                        setState(() {
                          _selectedGender = _gender;
                        });
                      },
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          child: Text("Kadın"),
                          value: 'kadın',
                        ),
                        DropdownMenuItem(
                          child: Text("Erkek"),
                          value: 'erkek',
                        ),
                        DropdownMenuItem(
                          child: Text("Diğer"),
                          value: 'diğer',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text('Reşit misiniz?'),
                        Checkbox(
                          value: _isAdult,
                          onChanged: (bool? value) {
                            setState(() {
                              _isAdult = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text('Sigara kullanıyor musunuz?'),
                        Switch(
                          value: _smokes,
                          onChanged: (bool? value) {
                            setState(() {
                              _smokes = value ?? false;
                            });
                          },
                          activeColor: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_smokes)
                Column(
                  children: [
                    Text('Günde kaç tane sigara kullanıyorsunuz?'),
                    Slider(
                      activeColor: Colors.lightGreenAccent,
                      value: _cigarettesPerDay,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: _cigarettesPerDay.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _cigarettesPerDay = value;
                        });
                      },
                    ),
                  ],
                ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
    Route sayfa1eGec=MaterialPageRoute(builder: (context)=>Sayfa1());
    Navigator.push(context,sayfa1eGec);
    },child: Text('Bilgileri Gönder'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
