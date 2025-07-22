import 'dart:async';

//	event loop, ağır işleri beklerken UI’yi dondurmadan diğer işlere devam edebilmeni sağlar.
void main() {
  print("1. main başladı");    //main içindeki sync() işlem 

  Future(() => print("2. Future (event queue)"));  //İlk Future artık sırada, event queue’dan geliyor.

  scheduleMicrotask(() => print("3. Microtask"));   //Microtask queue’ya gönderildi, sync işler bitince ilk önce o çalışır.

  Future.delayed(Duration.zero, () => print("4. Future.delayed")); //Future.delayed(Duration.zero) da event queue’ya girer, en sona kaldı.

  print("5. main sonu"); //main içindeki sync() işlem 

  Future(() {
    print("6. Future içinden yeni microtask"); //Future çalıştı ve içinden sync olarak yazılmış print çağrısı hemen çalıştı.
    scheduleMicrotask(() => print("7. Future içindeki Microtask")); //Bu bir microtask, yine çalışmak için sıraya girdi ve hemen 6’dan sonra çalıştı.
  });

  print("8. Bitti."); //main içindeki sync() işlem 
}

//1=>5=>8=>3=>6=>7=>2=>4

