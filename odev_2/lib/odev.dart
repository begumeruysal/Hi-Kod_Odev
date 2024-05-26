//2
double dikdortgenAlani(double uzunKenar, double kisaKenar) {
  return uzunKenar * kisaKenar;
}
//3
int carp(int a, int b) {
  int multiplyByTwo(int x) {
    return x * 2;
  }

  int result = a;
  for (int i = 0; i < (b-1); i++) {
    result = multiplyByTwo(result);
  }

  return result;
}

//4
List<String> elemanSil(List <String> liste, String eleman){
  liste.remove(eleman);
  return liste;
}

void sayilariSil(List<int> liste, int veri) {   //sayı olunca void kullanabiliyorum
  liste.remove(veri);
}


//5
class Sekil {
  int kenarSayisi;
  String ismi;
  int koseSayisi;


  Sekil(this.kenarSayisi, this.ismi, this.koseSayisi);

  void sekilBilgiYazdir(){
    print("Kenar Sayısı: $kenarSayisi ,Şekil Tipi: $ismi, Köşe Sayısı: $koseSayisi"); //return olmadı, this nasıl kullanılır??
  }
}


void main() {
  //2
  double uzunKenar = 9.54;
  double kisaKenar = 4.76;

  double alan = dikdortgenAlani(uzunKenar, kisaKenar);

  print("Dikdörtgenin alanı: $alan");

  //3
  int a = 5;
  int b = 3;

  int sonuc = carp(a, b);

  print("Sonuç: $sonuc");
  //4
  List<String> liste1=['Dikdörtgen','Daire','üçgen','Kare'];

  print(elemanSil(liste1,'Daire'));

  List<int> dizi = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  sayilariSil(dizi, 5);
  print("Güncellenmiş Liste: $dizi");

  //5
  Sekil dikdortgen = Sekil(4, "Dikdörtgen", 4);
  Sekil ucgen = Sekil(3, "Üçgen", 3);
  Sekil kare = Sekil(4, "Kare", 4);
  Sekil besgen = Sekil(5, "Beşgen", 5);
  Sekil sekizgen = Sekil(8, "Sekizgen", 8);

  dikdortgen.sekilBilgiYazdir();
  ucgen.sekilBilgiYazdir();
  kare.sekilBilgiYazdir();
  besgen.sekilBilgiYazdir();
  sekizgen.sekilBilgiYazdir();

}


