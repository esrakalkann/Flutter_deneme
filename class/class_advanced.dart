Future<void> main(List<String> args) async {
  final user = _User('veli', age: 21);


print(user.moneyType as String);




}

class _User {

final String name;
int? age;

//para tipi değişken

dynamic moneyType;

_User(this.name,{this.age});
//constructor. name zorunlu age optional olarak alınıyor.


}
