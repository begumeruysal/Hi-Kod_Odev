import 'package:flutter/material.dart';

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
  bool _formSubmitted = false;

  void _submitForm() {
    setState(() {
      _formSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
         child:Scaffold(
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
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        hint: Text('Cinsiyetinizi Seçiniz'),
                        value: _selectedGender,
                        onChanged: (_gender) {
                          setState(() {
                            _selectedGender = _gender!;
                          });
                        },
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                              child: Text("Lütfen Cinsiyet seçiniz. "),
                              value: 'none'),
                          DropdownMenuItem(
                              child: Text("Kadın"), value: 'kadın'),
                          DropdownMenuItem(
                              child: Text("Erkek"), value: 'erkek'),
                          DropdownMenuItem(
                              child: Text("Diğer"), value: 'diğer'),
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
                          borderRadius: BorderRadius.circular(10)),
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
                            borderRadius: BorderRadius.circular(10)),
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
                    )),
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
                    Container(
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Bilgileri gönder'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                if (_formSubmitted)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Adınız ve Soyadınız: ${_nameController.text}'),
                            Text('Cinsiyetiniz: $_selectedGender'),
                            Text(
                                'Reşit misiniz?: ${_isAdult ? "Evet" : "Hayır"}'),
                            Text(
                                'Sigara kullanıyor musunuz?: ${_smokes ? "Evet" : "Hayır"}'),
                            if (_smokes)
                              Text(
                                  'Günde kaç tane sigara kullanıyorsunuz?: ${_cigarettesPerDay.round()}'),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        )));
  }
}
