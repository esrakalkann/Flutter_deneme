// const kod compile edilirkenki değeri görür
//final anlık proje çalışırkenki değeri görür



  // bir magazaya isim verilecek
  // ver ornek isimler toplanir
  // ornek isimler: ahmet, mehmet veli, kx, x
  // magaza derki ben sadece karakter uzunlugu iki veya daha alti olanlari gormek istiyorum
  // bu kosula uyanlari yan yana gormek istiyorum aralinda bosluk olacak
  void main(){
  final String companyA="Ahmet";
  final String companyB="Mehmet";
  final String companyC="Veli";
  final String companyD="kx";
  final String companyE="x";
  final int companylength=2;
  print('Merhaba dünya!');

    String results = "";
  if (companyA.length > companylength) {
    results += companyA;
  }
  if (companyB.length > companylength) {
    results += companyB;
  }
  if (companyC.length > companylength) {
    results += companyC;
  }
  if (companyD.length > companylength) {
    results += companyD;
  }
  if (companyE.length > companylength) {
    results += companyD;
  }

  }



